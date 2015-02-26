//
//  Matrix4Tests.swift
//  SKLinearAlgebra
//
//  Created by Cameron Little on 2/24/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit
import Surge

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
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        let m2 = SCNMatrix4(
            x: SCNVector4(x: 1, y: 2, z: 3, w: 4),
            y: SCNVector4(x: 5, y: 6, z: 7, w: 8),
            z: SCNVector4(x: 2, y: 6, z: 4, w: 8),
            w: SCNVector4(x: 3, y: 1, z: 1, w: 2))

        let m3 = SCNMatrix4(
            contents: [1, 2, 3, 4,
                5, 6, 7, 8,
                2, 6, 4, 8,
                3, 1, 1, 2])

        let m4 = SCNMatrix4(
            contents: [[1, 2, 3, 4],
                [5, 6, 7, 8],
                [2, 6, 4, 8],
                [3, 1, 1, 2]])


        XCTAssertTrue(m == m2, "matrix is equal")
        XCTAssertTrue(m == m3, "matrix is equal")
        XCTAssertTrue(m == m4, "matrix is equal")

        XCTAssertEqual(m2.m11, Float(1), "m11")
        XCTAssertEqual(m2.m12, Float(2), "m12")
        XCTAssertEqual(m2.m13, Float(3), "m13")
        XCTAssertEqual(m2.m14, Float(4), "m14")
        XCTAssertEqual(m2.m21, Float(5), "m21")
        XCTAssertEqual(m2.m22, Float(6), "m22")
        XCTAssertEqual(m2.m23, Float(7), "m23")
        XCTAssertEqual(m2.m24, Float(8), "m24")
        XCTAssertEqual(m2.m31, Float(2), "m31")
        XCTAssertEqual(m2.m32, Float(6), "m32")
        XCTAssertEqual(m2.m33, Float(4), "m33")
        XCTAssertEqual(m2.m34, Float(8), "m34")
        XCTAssertEqual(m2.m41, Float(3), "m41")
        XCTAssertEqual(m2.m42, Float(1), "m42")
        XCTAssertEqual(m2.m43, Float(1), "m43")
        XCTAssertEqual(m2.m44, Float(2), "m44")

        XCTAssertEqual(m3.m11, Float(1), "m11")
        XCTAssertEqual(m3.m12, Float(2), "m12")
        XCTAssertEqual(m3.m13, Float(3), "m13")
        XCTAssertEqual(m3.m14, Float(4), "m14")
        XCTAssertEqual(m3.m21, Float(5), "m21")
        XCTAssertEqual(m3.m22, Float(6), "m22")
        XCTAssertEqual(m3.m23, Float(7), "m23")
        XCTAssertEqual(m3.m24, Float(8), "m24")
        XCTAssertEqual(m3.m31, Float(2), "m31")
        XCTAssertEqual(m3.m32, Float(6), "m32")
        XCTAssertEqual(m3.m33, Float(4), "m33")
        XCTAssertEqual(m3.m34, Float(8), "m34")
        XCTAssertEqual(m3.m41, Float(3), "m41")
        XCTAssertEqual(m3.m42, Float(1), "m42")
        XCTAssertEqual(m3.m43, Float(1), "m43")
        XCTAssertEqual(m3.m44, Float(2), "m44")
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

    func testTranspose() {
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        let t = SCNMatrix4(
            m11: 1, m12: 5, m13: 2, m14: 3,
            m21: 2, m22: 6, m23: 6, m24: 1,
            m31: 3, m32: 7, m33: 4, m34: 1,
            m41: 4, m42: 8, m43: 8, m44: 2)

        XCTAssertEqual(transpose(m), t, "transpose matrix")

        let i = SCNMatrix4(
            m11: 1, m12: 0, m13: 0, m14: 0,
            m21: 0, m22: 1, m23: 0, m24: 0,
            m31: 0, m32: 0, m33: 1, m34: 0,
            m41: 0, m42: 0, m43: 0, m44: 1)

        XCTAssertEqual(transpose(i), i, "Identity's transpose is identity")
    }

    func testInverse() {
        let m = SCNMatrix4(
            m11: 1, m12: 2, m13: 3, m14: 4,
            m21: 5, m22: 6, m23: 7, m24: 8,
            m31: 2, m32: 6, m33: 4, m34: 8,
            m41: 3, m42: 1, m43: 1, m44: 2)

        let rawInverse: [[Float]] =
            [[-0.166667, 0.0555556, -0.0555556, 0.333333],
            [-0.833333, 0.277778, 0.222222, -0.333333],
            [0.166667, 0.277778, -0.277778, -0.333333],
            [0.583333, -0.361111, 0.111111, 0.333333]]
        let im = SCNMatrix4(contents: rawInverse)

        XCTAssertTrue(inverse(m) ~= im, "inverse matrix")
    }

}
