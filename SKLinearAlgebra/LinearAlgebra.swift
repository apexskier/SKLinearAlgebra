//
//  LinearAlgebra.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

public protocol Vector {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self

    func *(lhs: Self, rhs: Self) -> Float

    func *(lhs: Float, rhs: Self) -> Self
    func *(lhs: Self, rhs: Float) -> Self
    func *(lhs: Int, rhs: Self) -> Self
    func *(lhs: Self, rhs: Int) -> Self

    func /(lhs: Self, rhs: Float) -> Self
    func /(lhs: Self, rhs: Int) -> Self
}

public protocol Matrix {
    var m11: Float { get set }
    var m12: Float { get set }
    var m13: Float { get set }
    var m21: Float { get set }
    var m22: Float { get set }
    var m23: Float { get set }
    var m31: Float { get set }
    var m32: Float { get set }
    var m33: Float { get set }
}

infix operator × { } // Cross product

public func * (left: SCNMatrix4, right: SCNVector4) -> SCNVector4 {
    let x = left.m11*right.x + left.m21*right.y + left.m31*right.z
    let y = left.m12*right.x + left.m22*right.y + left.m32*right.z
    let z = left.m13*right.x + left.m23*right.y + left.m33*right.z

    return SCNVector4(x: x, y: y, z: z, w: right.w * left.m44)
}

public func magnitude<T: Vector> (vec: T) -> Float {
    return sqrt(vec * vec)
}

public func normalize<T: Vector> (vec: T) -> T {
    return vec / magnitude(vec)
}

public func degrees<T:Vector> (left: T, right: T) -> Float {
    return cos((left * right) / (magnitude(left) * magnitude(right)))
}

public func component<T:Vector> (b: T, a: T) -> Float {
    return (a * b) / magnitude(a)
}

public func projection<T:Vector> (b: T, a: T) -> T {
    let adotb = a * b
    return (adotb / pow(magnitude(a), 2)) * a
}