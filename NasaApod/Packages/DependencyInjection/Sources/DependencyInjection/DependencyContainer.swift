//
//  DependencyContainer.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation

public final class DependencyContainer {

    private var registry: [String: Any] = [:]

    public init() { }
    
    public func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        registry[key] = factory
    }

    public func resolve<T>(_ type: T.Type) throws -> T {
        let key = String(describing: type)

        guard let factory = registry[key] else {
            throw DependencyError.dependencyNotRegistered(
                "No registered entry for \(T.self)"
            )
        }

        guard let typedFactory = factory as? () -> T else {
            throw DependencyError.dependencyNotRegistered(
                "Type mismatch for \(T.self)"
            )
        }

        return typedFactory()
    }
}
