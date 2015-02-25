//
//  Matrix4.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

extension SCNMatrix4: Matrix {
    public func copy() -> SCNMatrix4 {
        return SCNMatrix4(m11: m11, m12: m12, m13: m13, m14: m14, m21: m21, m22: m22, m23: m23, m24: m24, m31: m31, m32: m32, m33: m33, m34: m34, m41: m41, m42: m42, m43: m43, m44: m44)
    }

    public var description: String {
        return "[[\(m11), \(m12), \(m13), \(m14)]\n" +
            " [\(m21), \(m22), \(m23), \(m24)]\n" +
            " [\(m31), \(m32), \(m33), \(m34)]\n" +
            " [\(m41), \(m42), \(m43), \(m44)]]"
    }
}

public func SCNMatrix4Make(x: SCNVector4, y: SCNVector4, z: SCNVector4, w: SCNVector4) -> SCNMatrix4 {
    return SCNMatrix4(
        m11: x.x, m12: x.y, m13: x.z, m14: x.w,
        m21: y.x, m22: y.y, m23: y.z, m24: y.w,
        m31: z.x, m32: z.y, m33: z.z, m34: z.w,
        m41: w.x, m42: w.y, m43: w.z, m44: w.w)
}

// Matrix vector multiplication

public func *(left: SCNMatrix4, right: SCNVector4) -> SCNVector4 {
    let x = left.m11*right.x + left.m21*right.y + left.m31*right.z
    let y = left.m12*right.x + left.m22*right.y + left.m32*right.z
    let z = left.m13*right.x + left.m23*right.y + left.m33*right.z

    return SCNVector4(x: x, y: y, z: z, w: right.w * left.m44)
}

public func *(left: SCNMatrix4, right: SCNVector3) -> SCNVector3 {
    return (left * right.to4(0)).to3()
}

// Scalar multiplication

public func *(left: SCNMatrix4, right: Float) -> SCNMatrix4 {
    return SCNMatrix4(
        m11: left.m11 * right, m12: left.m12 * right, m13: left.m13 * right, m14: left.m14 * right,
        m21: left.m21 * right, m22: left.m22 * right, m23: left.m23 * right, m24: left.m24 * right,
        m31: left.m31 * right, m32: left.m32 * right, m33: left.m33 * right, m34: left.m34 * right,
        m41: left.m41 * right, m42: left.m42 * right, m43: left.m43 * right, m44: left.m44 * right)
}

public func *(left: Float, right: SCNMatrix4) -> SCNMatrix4 {
    return right * left
}

public func ==(lhs: SCNMatrix4, rhs: SCNMatrix4) -> Bool {
    return SCNMatrix4EqualToMatrix4(lhs, rhs)
}

public func det(m: SCNMatrix4) -> Float {
    let a = (m.m14 * m.m23 * m.m32 * m.m41) - (m.m13 * m.m24 * m.m32 * m.m41)
    let b = (m.m14 * m.m22 * m.m33 * m.m41) + (m.m12 * m.m24 * m.m33 * m.m41)
    let c = (m.m13 * m.m22 * m.m34 * m.m41) - (m.m12 * m.m23 * m.m34 * m.m41)
    let d = (m.m14 * m.m23 * m.m31 * m.m42) + (m.m13 * m.m24 * m.m31 * m.m42)
    let e = (m.m14 * m.m21 * m.m33 * m.m42) - (m.m11 * m.m24 * m.m33 * m.m42)
    let f = (m.m13 * m.m21 * m.m34 * m.m42) + (m.m11 * m.m23 * m.m34 * m.m42)
    let g = (m.m14 * m.m22 * m.m31 * m.m43) - (m.m12 * m.m24 * m.m31 * m.m43)
    let h = (m.m14 * m.m21 * m.m32 * m.m43) + (m.m11 * m.m24 * m.m32 * m.m43)
    let i = (m.m12 * m.m21 * m.m34 * m.m43) - (m.m11 * m.m22 * m.m34 * m.m43)
    let j = (m.m13 * m.m22 * m.m31 * m.m44) + (m.m12 * m.m23 * m.m31 * m.m44)
    let k = (m.m13 * m.m21 * m.m32 * m.m44) - (m.m11 * m.m23 * m.m32 * m.m44)
    let l = (m.m12 * m.m21 * m.m33 * m.m44) + (m.m11 * m.m22 * m.m33 * m.m44)

    return a - b + c - d + e - f + g - h + i - j + k - l
}

public func inverse(m: SCNMatrix4) -> SCNMatrix4? {
    let detM = det(m)
    if detM == 0 {
        return nil
    }

    return m * (1 / detM)
}
