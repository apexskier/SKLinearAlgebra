//
//  Matrix4Tests.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit

class Matrix4Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDeterminant() {
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        let d = det(m)

        XCTAssertEqual(d, Float(27), "determinate of matrix")

        let m2 = SCNMatrix4(
            m11: 3, m12: 2, m13: -1, m14: 4,
            m21: 2, m22: 1, m23: 5, m24: 7,
            m31: 0, m32: 5, m33: 2, m34: -6,
            m41: -1, m42: 2, m43: 1, m44: 0)

        let d2 = det(m2)

        XCTAssertEqual(d2, Float(-418), "determinate of second matrix")
    }

}
