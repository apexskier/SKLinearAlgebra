//
//  Vector4.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

extension SCNVector4: Equatable, Vector {
    public init(array: [Float]) {
        assert(array.count == 4)

        x = array[0]
        y = array[1]
        z = array[2]
        w = array[3]
    }

    public func to3() -> SCNVector3 {
        return SCNVector3(x: x, y: y, z: z)
    }

    public func copy() -> SCNVector4 {
        return SCNVector4(x: x, y: y, z: z, w: w)
    }

    public var description: String {
        return "[\(x), \(y), \(z), \(w)]"
    }

    subscript(i: Int) -> Float {
        assert(0 <= i && i < 4, "Index out of range")
        switch i {
        case 0:
            return x
        case 1:
            return y
        case 2:
            return z
        case 3:
            return w
        default:
            fatalError("Index out of range")
        }
    }

    private var floatArray: [Float] {
        get {
            return [x, y, z, w]
        }
        set {
            x = newValue[0]
            y = newValue[1]
            z = newValue[2]
            w = newValue[3]
        }
    }

    private var doubleArray: [Double] {
        get {
            return [Double(x), Double(y), Double(z), Double(w)]
        }
        set {
            x = Float(newValue[0])
            y = Float(newValue[1])
            z = Float(newValue[2])
            w = Float(newValue[3])
        }
    }
}

// Equality and equivalence

public func ==(lhs: SCNVector4, rhs: SCNVector4) -> Bool {
    return SCNVector4EqualToVector4(lhs, rhs)
}

public func ~=(lhs: SCNVector4, rhs: SCNVector4) -> Bool {
    return abs(lhs.x - rhs.x) < EPSILON &&
        abs(lhs.y - rhs.y) < EPSILON &&
        abs(lhs.z - rhs.z) < EPSILON &&
        abs(lhs.w - rhs.w) < EPSILON
}

public func !~=(lhs: SCNVector4, rhs: SCNVector4) -> Bool {
    return !(lhs ~= rhs)
}

// Dot product

public func *(left: SCNVector4, right: SCNVector4) -> Float {
    return (left.x * right.x) + (left.y * right.y) + (left.z * right.z)
}

// Cross product

public func ×(left: SCNVector4, right: SCNVector4) -> SCNVector4 {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x

    let w = left.w * right.w

    return SCNVector4(x: x, y: y, z: z, w: w)
}


// Scalar multiplication

public func *(left: SCNVector4, right: Float) -> SCNVector4 {
    let x = left.x * right
    let y = left.y * right
    let z = left.z * right

    return SCNVector4(x: x, y: y, z: z, w: left.w) // TODO: Is the w part correct?
}

public func *(left: Float, right: SCNVector4) -> SCNVector4 {
    let x = right.x * left
    let y = right.y * left
    let z = right.z * left

    return SCNVector4(x: x, y: y, z: z, w: right.w)
}

public func *(left: SCNVector4, right: Int) -> SCNVector4 {
    return left * Float(right)
}

public func *(left: Int, right: SCNVector4) -> SCNVector4 {
    return Float(left) * right
}

// Scalar Division

public func /(left: SCNVector4, right: Float) -> SCNVector4 {
    let x = left.x / right
    let y = left.y / right
    let z = left.z / right

    return SCNVector4(x: x, y: y, z: z, w: left.w)
}

public func /(left: SCNVector4, right: Int) -> SCNVector4 {
    return left / Float(right)
}

// Vector subtraction

public func -(left: SCNVector4, right: SCNVector4) -> SCNVector4 {
    let x = left.x - right.x
    let y = left.y - right.y
    let z = left.z - right.z

    let w = left.w * right.w

    return SCNVector4(x: x, y: y, z: z, w: w)
}

// Vector addition

public func +(left: SCNVector4, right: SCNVector4) -> SCNVector4 {
    let x = left.x + right.x
    let y = left.y + right.y
    let z = left.z + right.z

    let w = left.w * right.w

    return SCNVector4(x: x, y: y, z: z, w: w)
}