//
//  SKLinearAlgebraTests.swift
//  SKLinearAlgebraTests
//
//  Created by Cameron Little on 2/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit

class SKLinearAlgebraTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEquatable() {
        let a = SCNVector3(x: 9, y: 5, z: 2)
        let A = SCNVector3(x: 9, y: 5, z: 2)
        let c = SCNVector3(x: 8, y: 5, z: 2)

        XCTAssertTrue(a == A, "Vector3 is equitable (==)")
        XCTAssertTrue(a != c, "Vector3 is equitable (!=)")

        let b = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let B = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let C = SCNVector4(x: 8, y: 5, z: 2, w: 1)

        XCTAssertTrue(b == b, "Vector4 is equitable (==)")
        XCTAssertTrue(b != C, "Vector4 is equitable (!=)")
    }

    func testVectorConversion3to4() {
        let a = SCNVector3(x: 9, y: 5, z: 2)
        let ac = a.to4(1)

        let b = SCNVector4(x: 9, y: 5, z: 2, w: 1)

        XCTAssertTrue(SCNVector4EqualToVector4(ac, b), "Converted Vector3 to Vector4")
    }

    func testVectorConversion4to3() {
        let a = SCNVector4(x: 9, y: 5, z: 2, w: 1)
        let ac = a.to3()

        let b = SCNVector3(x: 9, y: 5, z: 2)

        XCTAssertTrue(SCNVector3EqualToVector3(ac, b), "Converted Vector4 to Vector3")
    }

    func testDotProduct() {
        // This is an example of a functional test case.
        let a = SCNVector3(x: 0, y: 3, z: -7)
        let b = SCNVector3(x: 2, y: 3, z: 1)

        XCTAssertEqual(a * b, 2, "Dot product of Vector3 correct")

        XCTAssertEqual(a.to4(0) * b.to4(0), 2, "Dot product of Vector4 correct")
    }

    func testScalarProductV3() {
        let a = SCNVector3(x: 2, y: 3, z: 1)
        let cf: Float = 4.0
        let ci: Int = 4

        let result = SCNVector3(x: 8, y: 12, z: 4)

        XCTAssertEqual(a * cf, result, "Float scalar right multiplication")
        XCTAssertEqual(cf * a, result, "Float scalar left multiplication")
        XCTAssertEqual(a * ci, result, "Int scalar right multiplication")
        XCTAssertEqual(ci * a, result, "Int scalar left multiplication")
    }

    func testScalarProductV4() {
        let a = SCNVector4(x: 2, y: 3, z: 1, w: 0)
        let cf: Float = 4.0
        let ci: Int = 4

        let result = SCNVector4(x: 8, y: 12, z: 4, w: 0)

        XCTAssertEqual(a * cf, result, "Float scalar right multiplication")
        XCTAssertEqual(cf * a, result, "Float scalar left multiplication")
        XCTAssertEqual(a * ci, result, "Int scalar right multiplication")
        XCTAssertEqual(ci * a, result, "Int scalar left multiplication")
    }

}