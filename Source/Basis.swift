//
//  Basis.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import Foundation
import SceneKit

public class Basis {
    let origin: Position

    let xAxis: Direction
    let yAxis: Direction
    let zAxis: Direction

    init(node: SCNNode) {
        origin = node.position

        let transform = node.transform

        xAxis = transform * Direction(x: 1, y: 0, z: 0)
        yAxis = transform * Direction(x: 0, y: 1, z: 0)
        zAxis = transform * Direction(x: 0, y: 0, z: 1)
    }

    init(origin: Position, x: Direction, y: Direction, z: Direction) {
        self.origin = origin
        self.xAxis = x
        self.yAxis = y
        self.zAxis = z

        // verify that vectors are linearly independent

    }

    // class var Workaround:
    private struct StdBasisStruct {
        static var standardBasis = Basis(origin: Position(x: 0, y: 0, z: 0), x: Direction(x: 1, y: 0, z: 0), y: Direction(x: 0, y: 1, z: 0), z: Direction(x: 0, y: 0, z: 1))
    }
    class var StandardBasis: Basis {
        get {
            return StdBasisStruct.standardBasis
        }
    }
    //  Use the following once supported
    //class var StandardBasis = Basis(origin: Position(x: 0, y: 0, z: 0), x: Direction(x: 1, y: 0, z: 0), y: Direction(x: 0, y: 1, z: 0), z: Direction(x: 0, y: 0, z: 1))

    lazy var change: SCNMatrix4? = {
        let x4: SCNVector4 = self.xAxis.to4(0)
        let y4: SCNVector4 = self.yAxis.to4(0)
        let z4: SCNVector4 = self.zAxis.to4(0)
        let w4: SCNVector4 = self.origin.to4(1)
        return inverse(SCNMatrix4(x: x4, y: y4, z: z4, w: w4))
    }()
}