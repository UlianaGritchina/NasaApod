//
//  DependencyError.swift
//  DependencyContainer
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import Foundation

enum DependencyError: Error {
    case dependencyNotRegistered(String)
}
