//
//  ConnectionType.swift
//  Core
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import Foundation
import Network

public enum ConnectionType: Sendable {
    case wifi
    case cellular
    case wiredEthernet
    case loopback
    case other
    case unknown
}
