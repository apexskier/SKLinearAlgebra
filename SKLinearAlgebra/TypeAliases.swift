//
//  TypeAliases.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//
//
//  These aliases should eventually help developers organize their code and
//  be more efficient.

import Foundation
import SceneKit

// https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes

/* Now what cool things can I do with this?
 * TODO
 */

typealias Position = SCNVector3
typealias Normal = SCNVector3
typealias Scale = SCNVector3
typealias Translate = SCNVector3

typealias Rotation = SCNVector4
typealias Torque = SCNVector4
typealias Color = SCNVector4
typealias ColorRange = SCNVector4

typealias Quaternion = SCNQuaternion

typealias Transform = SCNMatrix4