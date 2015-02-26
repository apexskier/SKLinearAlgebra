//
//  LinearAlgebra.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

let EPSILON: Float = 0.00001

public protocol Copyable {
    func copy() -> Self
}

public protocol Comparable {
    func ~=(lhs: Self, rhs: Self) -> Bool
    func !~=(lhs: Self, rhs: Self) -> Bool
}

public protocol Vector: Equatable, Printable, Copyable, Comparable {
    func +(lhs: Self, rhs: Self) -> Self
    func +=(inout lhs: Self, rhs: Self)
    func -(lhs: Self, rhs: Self) -> Self
    func -=(inout lhs: Self, rhs: Self)

    func *(lhs: Self, rhs: Self) -> Float

    func *(lhs: Float, rhs: Self) -> Self
    func *(lhs: Self, rhs: Float) -> Self
    func *=(inout lhs: Self, rhs: Float)
    func *(lhs: Int, rhs: Self) -> Self
    func *(lhs: Self, rhs: Int) -> Self
    func *=(inout lhs: Self, rhs: Int)

    func /(lhs: Self, rhs: Float) -> Self
    func /=(inout lhs: Self, rhs: Float)
    func /(lhs: Self, rhs: Int) -> Self
    func /=(inout lhs: Self, rhs: Int)

    func ×(lhs: Self, rhs: Self) -> Self
}

public protocol Matrix: Equatable, Printable, Copyable, Comparable {
    func *(lhs: Float, rhs: Self) -> Self
    func *(lhs: Self, rhs: Float) -> Self
    func *=(inout lhs: Self, rhs: Float)
    func *(lhs: Int, rhs: Self) -> Self
    func *(lhs: Self, rhs: Int) -> Self
    func *=(inout lhs: Self, rhs: Int)

    func /(lhs: Self, rhs: Float) -> Self
    func /=(inout lhs: Self, rhs: Float)
    func /(lhs: Self, rhs: Int) -> Self
    func /=(inout lhs: Self, rhs: Int)
}

infix operator × { } // Cross product

infix operator ~= { } // Equivalent

infix operator !~= { } // Not equivalent

public func cross<T:Vector> (a: T, b: T) -> T {
    return a × b
}

public func magnitude<T: Vector> (vec: T) -> Float {
    return sqrt(vec * vec)
}

public func normalize<T: Vector> (vec: T) -> T {
    let vmag = magnitude(vec)
    if vmag == 0 {
        fatalError("Zero vector provided to normalize")
    }
    return vec / vmag
}

public func degrees<T:Vector> (left: T, right: T) -> Float {
    let ml = magnitude(left)
    let mr = magnitude(right)
    if ml == 0 || mr == 0 {
        fatalError("Zero vector provided to degrees")
    }
    return acos((left * right) / (ml * mr))
}

/* comp_{b} a
 * result is the length of vector a on vector b
 *
 *              b
 *              |
 *              |
 *            { |   / a
 * comp(a, b) { |  /
 *            { | /
 *
 */
public func component<T:Vector> (a: T, b: T) -> Float {
    let bmag = magnitude(b)
    if bmag == 0 {
        fatalError("Zero vector provided to component")
    }
    return (a * b) / bmag
}

/* proj_{b} a 
 */
public func projection<T:Vector> (a: T, b: T) -> T {
    let magb = magnitude(b)
    if magb == 0 {
        fatalError("Zero vector provided to projection")
    }
    let adotb = a * b
    return (adotb / pow(magb, 2)) * b
}