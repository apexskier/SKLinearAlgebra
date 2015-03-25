//
//  Nodes.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 3/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import SceneKit

extension SCNNode {
    public func up() -> SCNVector3 {
        let std = SCNVector3(x: 0, y: 1, z: 0)
        return self.transform * std
    }

    public func left() -> SCNVector3 {
        let std = SCNVector3(x: 1, y: 0, z: 0)
        return self.transform * std
    }

    public func forward() -> SCNVector3 {
        let std = SCNVector3(x: 0, y: 0, z: 1)
        return self.transform * std
    }
}