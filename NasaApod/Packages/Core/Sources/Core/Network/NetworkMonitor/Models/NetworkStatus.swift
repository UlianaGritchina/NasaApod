//
//  NetworkStatus.swift
//  Core
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import Foundation

public struct NetworkStatus: Sendable, Equatable {
    public let isConnected: Bool
    public let connectionType: ConnectionType

    public init(
        isConnected: Bool,
        connectionType: ConnectionType
    ) {
        self.isConnected = isConnected
        self.connectionType = connectionType
    }

    public static let unknown = NetworkStatus(
        isConnected: false,
        connectionType: .unknown
    )
}
