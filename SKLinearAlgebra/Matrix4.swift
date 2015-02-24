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

public func * (left: SCNMatrix4, right: SCNVector4) -> SCNVector4 {
    let x = left.m11*right.x + left.m21*right.y + left.m31*right.z
    let y = left.m12*right.x + left.m22*right.y + left.m32*right.z
    let z = left.m13*right.x + left.m23*right.y + left.m33*right.z

    return SCNVector4(x: x, y: y, z: z, w: right.w * left.m44)
}

public func ==(lhs: SCNMatrix4, rhs: SCNMatrix4) -> Bool {
    return SCNMatrix4EqualToMatrix4(lhs, rhs)
}