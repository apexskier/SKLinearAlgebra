//
//  Rotations.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 3/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

// Quaternions:
// rotation described by a vector and a rotation.

extension SCNQuaternion {
    public func reverse() -> SCNQuaternion {
        var result = self
        result.w = -result.w
        return result
    }
}