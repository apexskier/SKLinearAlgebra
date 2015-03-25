//
//  SKLinearAlgebraTests.swift
//  SKLinearAlgebraTests
//
//  Created by Cameron Little on 2/23/15.
//  Copyright (c) 2015 Cameron Little. All rights reserved.
//

import XCTest
import SceneKit

private let EPSILON_LESS: Float = 0.001

class SKLinearAlgebraTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMagnitude() {
        let a = SCNVector3(x: 3, y: 2, z: -4)

        XCTAssertEqual(magnitude(a), sqrt(29), "magnitude test")
    }

    func testNormalization() {
        let a = SCNVector3(x: 3, y: 2, z: -5)
        let normA = normalize(a)

        let m: Float = sqrt(38.0)
        let normAreal = SCNVector3(x: 3/m, y: 2/m, z: -5/m)

        XCTAssertEqual(normA, normAreal, "normalized vector correct")
        XCTAssertEqual(magnitude(normA), Float(1), "normalized vector is length 1")
    }

    func testangleBetweenVectors() {
        let a = SCNVector3(x: 1, y: 2, z: 3)
        let b = SCNVector3(x: 2, y: 4, z: 6)
        let c = SCNVector3(x: -1, y: -2, z: -3)

        XCTAssertEqualWithAccuracy(angle(a, a), Float(0), EPSILON_LESS, "Same vector is parallel")
        XCTAssertEqualWithAccuracy(angle(a, b), Float(0), EPSILON_LESS, "Parallel vectors are parallel")
        XCTAssertEqualWithAccuracy(angle(a, c), Float(M_PI), EPSILON_LESS, "Opposite vectors are opposite")

        let p = SCNVector3(x: 4, y: 0, z: 7)
        let q = SCNVector3(x: -2, y: 1, z: 3)

        XCTAssertEqualWithAccuracy(angle(p, q), Float(1.1252), EPSILON_LESS, "Random vectors have correct angle.")
    }

    func testVectorComponent() {
        let q = SCNVector3(x: 3, y: 2, z: 1)
        let n = SCNVector3(x: 2, y: 1, z: -2)

        let result: Float = 2

        XCTAssertEqual(component(q, n), result, "component test")

        let a = SCNVector3(x: 1, y: 2, z: 3)
        let b = SCNVector3(x: 1, y: 2, z: 3)

        XCTAssertEqualWithAccuracy(component(a, b), magnitude(a), EPSILON, "equal vectors component returns magnitude")

        let c = SCNVector3(x: -1, y: -2, z: -3)

        XCTAssertEqualWithAccuracy(component(a, b), magnitude(a), EPSILON, "opposite vectors component returns magnitude")

        let d = SCNVector3(x: 0, y: 0, z: 2)
        let e = SCNVector3(x: 1, y: 0, z: 0)

        XCTAssertEqual(component(d, e), Float(0), "orthogonal vectors component is zero")
    }

    func testVectorProjection() {
        let p = SCNVector3(x: 0, y: 3, z: 0)
        let q = SCNVector3(x: 1, y: 0, z: 0)
        
        XCTAssertEqual(projection(q, p), SCNVector3Zero, "orthogonal projection is zero vector")

        let x = SCNVector3(x: 0, y: 3, z: 0)
        let y = SCNVector3(x: 3, y: 1, z: 0)
        let z = SCNVector3(x: 0, y: 1, z: 0)
        XCTAssertEqual(projection(y, x), z, "simple projection test")

        let a = SCNVector3(x: 2, y: 4, z: -1)
        let b = SCNVector3(x: 3, y: 3, z: 4)
        let result = SCNVector3(x: 21.0/17.0, y: 21.0/17.0, z: 28.0/17.0)

        XCTAssertTrue(projection(a, b) ~= result, "projection test")

        let d = SCNVector4(x: 0, y: 1, z: -1, w: 0)
        let c = SCNVector4(x: 0, y: 1, z: 0, w: 1)
        let e = SCNVector4(x: 0, y: 0.5, z: -0.5, w: 0)

        XCTAssertTrue(projection(c, d) ~= e, "projection test 2")
    }

}