//
//  Operators.swift
//  RewardKit
//
//  Created by Jean Raphael Bordet on 12/06/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: AdditionPrecedence
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

precedencegroup SingleTypeComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator |>: ForwardApplication

public func |> <A, B>(a: A,
               f: (A) -> B) -> B {
    return f(a)
}

infix operator >>>: ForwardComposition

public func >>> <A, B, C>(f: @escaping (A) -> B,
                   g: @escaping (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}

infix operator <>: SingleTypeComposition
public func <> <A>(f: @escaping (A) -> A,
                   g: @escaping (A) -> A) -> (A) -> A {
    return f >>> g
}

public func <> <A>(f: @escaping (inout A) -> Void,
                   g: @escaping (inout A) -> Void) -> (inout A) -> Void {
    return { a in
        f(&a)
        g(&a)
    }
}

public func <> <A: AnyObject>(f: @escaping (A) -> Void,
                              g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}
