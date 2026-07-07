//
//  DependencyResolver.swift
//  DependencyInjection
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import Foundation

public protocol DependencyResolver {
    func resolve<T>(_ type: T.Type) throws -> T
}
