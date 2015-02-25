//
//  Vector3.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

private let EPSILON: Float = 0.00001

extension SCNVector3: Equatable, Vector {
    public func to4(w: Float) -> SCNVector4 {
        return SCNVector4(x: x, y: y, z: z, w: w)
    }

    public func copy() -> SCNVector3 {
        return SCNVector3(x: x, y: y, z: z)
    }

    public var description: String {
        return "[\(x), \(y), \(z)]"
    }
}

// Dot product

public func * (left: SCNVector3, right: SCNVector3) -> Float {
    return (left.x * right.x + left.y * right.y + left.z * right.z)
}

// Cross product

public func × (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x

    return SCNVector3(x: x, y: y, z: z)
}

// Equality and equivalence

public func ==(lhs: SCNVector3, rhs: SCNVector3) -> Bool {
    return SCNVector3EqualToVector3(lhs, rhs)
}

public func ≈(lhs: SCNVector3, rhs: SCNVector3) -> Bool {
    return abs(lhs.x - rhs.x) < EPSILON &&
        abs(lhs.y - rhs.y) < EPSILON &&
        abs(lhs.z - rhs.z) < EPSILON
}

public func !≈(lhs: SCNVector3, rhs: SCNVector3) -> Bool {
    return !(lhs ≈ rhs)
}

// Scalar multiplication

public func *(left: SCNVector3, right: Float) -> SCNVector3 {
    let x = left.x * right
    let y = left.y * right
    let z = left.z * right

    return SCNVector3(x: x, y: y, z: z)
}

public func *(left: Float, right: SCNVector3) -> SCNVector3 {
    let x = right.x * left
    let y = right.y * left
    let z = right.z * left

    return SCNVector3(x: x, y: y, z: z)
}

public func *(left: SCNVector3, right: Int) -> SCNVector3 {
    return left * Float(right)
}

public func *(left: Int, right: SCNVector3) -> SCNVector3 {
    return Float(left) * right
}

// Scalar Division

public func /(left: SCNVector3, right: Float) -> SCNVector3 {
    let x = left.x / right
    let y = left.y / right
    let z = left.z / right

    return SCNVector3(x: x, y: y, z: z)
}

public func /(left: SCNVector3, right: Int) -> SCNVector3 {
    return left / Float(right)
}

// Vector subtraction

public func -(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    let x = left.x - right.x
    let y = left.y - right.y
    let z = left.z - right.z

    return SCNVector3(x: x, y: y, z: z)
}

// Vector addition

public func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    let x = left.x + right.x
    let y = left.y + right.y
    let z = left.z + right.z

    return SCNVector3(x: x, y: y, z: z)
}