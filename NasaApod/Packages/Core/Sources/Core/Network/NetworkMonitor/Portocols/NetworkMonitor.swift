//
//  NetworkMonitor.swift
//  Core
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import Foundation

public protocol NetworkMonitor: Sendable {

    /// Current network status.
    var currentStatus: NetworkStatus { get }

    /// A stream of network status updates.
    var statusUpdates: AsyncStream<NetworkStatus> { get }
}
