//
//  Optional.swift
//  Optional
//
//  Created by Bernardo Breder on 15/01/17.
//
//

import Foundation

#if SWIFT_PACKAGE
#endif

extension Optional {
    
    public func orElse<T>(_ f: () throws -> T) rethrows -> T {
        switch self {
        case .some(let val):
            return val as! T
        case _:
            return try f()
        }
    }
    
    @discardableResult
    public func peek(_ f: (Wrapped) throws -> Void) rethrows -> Optional<Wrapped> {
        switch self {
        case .some(let val):
            try f(val)
            return self
        default:
            return self
        }
    }
    
    public func some(_ f: (Wrapped) throws -> Wrapped) rethrows -> Optional<Wrapped> {
        switch self {
        case .some(let val):
            return try f(val)
        case _:
            return self
        }
    }
    
    public func none(_ f: () throws -> Wrapped) rethrows -> Optional<Wrapped> {
        switch self {
        case .some:
            return self
        case _:
            return try f()
        }
    }
    
    public func orThrow(_ error: Error) throws -> Wrapped {
        switch self {
        case .some:
            return self!
        default:
            throw error
        }
    }
    
    public var empty: Bool {
        switch self {
        case .none:
            return true
        default:
            return false
        }
    }
    
    public var has: Bool {
        switch self {
        case .some:
            return true
        default:
            return false
        }
    }
    
}
