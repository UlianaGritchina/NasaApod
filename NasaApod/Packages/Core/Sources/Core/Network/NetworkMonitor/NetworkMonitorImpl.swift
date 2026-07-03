//
//  NetworkMonitorImpl.swift
//  Core
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import Foundation
import Network

public final class NetworkMonitorImpl: NetworkMonitor, @unchecked Sendable {

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    private let lock = NSLock()

    private var status = NetworkStatus.unknown

    public var currentStatus: NetworkStatus {
        lock.lock()
        defer { lock.unlock() }
        return status
    }

    public let statusUpdates: AsyncStream<NetworkStatus>

    private let continuation: AsyncStream<NetworkStatus>.Continuation

    public init() {

        var continuation: AsyncStream<NetworkStatus>.Continuation!

        self.statusUpdates = AsyncStream { continuation = $0 }
        self.continuation = continuation

        monitor.pathUpdateHandler = { [weak self] path in
            self?.handle(path)
        }

        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
        continuation.finish()
    }

    private func handle(_ path: NWPath) {

        let status = NetworkStatus(
            isConnected: path.status == .satisfied,
            connectionType: Self.connectionType(from: path)
        )

        lock.lock()
        self.status = status
        lock.unlock()

        continuation.yield(status)
    }

    private static func connectionType(from path: NWPath) -> ConnectionType {

        if path.usesInterfaceType(.wifi) {
            return .wifi
        }

        if path.usesInterfaceType(.cellular) {
            return .cellular
        }

        if path.usesInterfaceType(.wiredEthernet) {
            return .wiredEthernet
        }

        if path.usesInterfaceType(.loopback) {
            return .loopback
        }

        if path.usesInterfaceType(.other) {
            return .other
        }

        return .unknown
    }
}
