//
//  ArrayOptional.swift
//  Optional
//
//  Created by Bernardo Breder on 15/01/17.
//
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

extension Sequence where Iterator.Element: OptionalType {
    
    public func notnil() -> [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
    
}

extension Sequence {
    
    public func cast<T>(_ type: T.Type) -> [T] {
        var result: [T] = []
        for element in self {
            if let cast = element as? T {
                result.append(cast)
            }
        }
        return result
    }
    
}
