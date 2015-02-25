//
//  Matrix4Tests.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit
//import Accelerate

// https://github.com/haginile/SwiftAccelerate

class Matrix4Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMatrix() {
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        XCTAssertEqual(m.m11, Float(1), "m11")
        XCTAssertEqual(m.m12, Float(2), "m12")
        XCTAssertEqual(m.m13, Float(3), "m13")
        XCTAssertEqual(m.m14, Float(4), "m14")
        XCTAssertEqual(m.m21, Float(5), "m21")
        XCTAssertEqual(m.m22, Float(6), "m22")
        XCTAssertEqual(m.m23, Float(7), "m23")
        XCTAssertEqual(m.m24, Float(8), "m24")
        XCTAssertEqual(m.m31, Float(2), "m31")
        XCTAssertEqual(m.m32, Float(6), "m32")
        XCTAssertEqual(m.m33, Float(4), "m33")
        XCTAssertEqual(m.m34, Float(8), "m34")
        XCTAssertEqual(m.m41, Float(3), "m41")
        XCTAssertEqual(m.m42, Float(1), "m42")
        XCTAssertEqual(m.m43, Float(1), "m43")
        XCTAssertEqual(m.m44, Float(2), "m44")
    }

    func testAltMatrixCreate() {
        let m = SCNMatrix4MakeColumns(
            SCNVector4(x: 1, y: 2, z: 3, w: 4),
            SCNVector4(x: 5, y: 6, z: 7, w: 8),
            SCNVector4(x: 2, y: 6, z: 4, w: 8),
            SCNVector4(x: 3, y: 1, z: 1, w: 2))

        let m2 = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        XCTAssertTrue(m == m2, "matrix is equal")

        XCTAssertEqual(m.m11, Float(1), "m11")
        XCTAssertEqual(m.m12, Float(2), "m12")
        XCTAssertEqual(m.m13, Float(3), "m13")
        XCTAssertEqual(m.m14, Float(4), "m14")
        XCTAssertEqual(m.m21, Float(5), "m21")
        XCTAssertEqual(m.m22, Float(6), "m22")
        XCTAssertEqual(m.m23, Float(7), "m23")
        XCTAssertEqual(m.m24, Float(8), "m24")
        XCTAssertEqual(m.m31, Float(2), "m31")
        XCTAssertEqual(m.m32, Float(6), "m32")
        XCTAssertEqual(m.m33, Float(4), "m33")
        XCTAssertEqual(m.m34, Float(8), "m34")
        XCTAssertEqual(m.m41, Float(3), "m41")
        XCTAssertEqual(m.m42, Float(1), "m42")
        XCTAssertEqual(m.m43, Float(1), "m43")
        XCTAssertEqual(m.m44, Float(2), "m44")
    }

    func testEquatable() {
        let a = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)
        let b = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)
        let c = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 3, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        XCTAssertTrue(a == b, "Matrix4 is equitable (==)")
        XCTAssertTrue(a == b, "Matrix4 is equitable (==)")
        XCTAssertTrue(b != c, "Matrix4 is equitable (!=)")
    }

    func testEquivalence() {
        let a = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)
        let b = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)
        let c = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 3, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        XCTAssertTrue(a ~= a, "Matrix4 is equitable (~=)")
        XCTAssertTrue(a ~= b, "Matrix4 is equitable (~=)")
        XCTAssertTrue(b !~= c, "Matrix4 is equitable (!~=)")
    }

    func testSubscript() {
        let m = SCNMatrix4MakeColumns(
            SCNVector4(x: 1, y: 2, z: 3, w: 4),
            SCNVector4(x: 5, y: 6, z: 7, w: 8),
            SCNVector4(x: 2, y: 6, z: 4, w: 8),
            SCNVector4(x: 3, y: 1, z: 1, w: 2))

        XCTAssertEqual(m[0, 0], Float(1), "testing subscript")
        XCTAssertEqual(m[3, 2], Float(8), "testing subscript")
        XCTAssertEqual(m[3, 3], Float(2), "testing subscript")
        XCTAssertEqual(m[1, 2], Float(6), "testing subscript")
    }

    func testDeterminant() {
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        let d = det(m)

        XCTAssertEqual(d, Float(72), "determinate of matrix")

        let m2 = SCNMatrix4(
            m11: 3, m12: 2, m13: -1, m14: 4,
            m21: 2, m22: 1, m23: 5, m24: 7,
            m31: 0, m32: 5, m33: 2, m34: -6,
            m41: -1, m42: 2, m43: 1, m44: 0)

        let d2 = det(m2)

        XCTAssertEqual(d2, Float(-418), "determinate of second matrix")
    }

}
