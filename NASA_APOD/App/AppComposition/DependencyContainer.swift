//
//  DependencyContainer.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation

final class DependencyContainer {

    private var registry: [String: Any] = [:]

    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        registry[key] = factory
    }

    func resolve<T>(_ type: T.Type) throws -> T {
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

enum DependencyError: Error {
    case dependencyNotRegistered(String)
}

protocol DependencyResolver {
    func resolve<T>(_ type: T.Type) throws -> T
}
