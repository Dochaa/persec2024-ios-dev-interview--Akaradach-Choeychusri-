//
//  TribonacciTests.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class TribonacciTests: XCTestCase {
    func testTribonacciFullSeed() {
        XCTAssertEqual(tribonacci([1, 3, 5], 5), [1, 3, 5, 9, 17])
        XCTAssertEqual(tribonacci([10, 10, 10], 4), [10, 10, 10, 30])
    }

    func testTribonacciShortSeed() {
        XCTAssertEqual(tribonacci([1], 4), [1, 0, 0, 1])
        XCTAssertEqual(tribonacci([2, 2], 5), [2, 2, 0, 4, 6])
    }

    func testTribonacciEmptySeed() {
        XCTAssertEqual(tribonacci([], 6), [0, 0, 0, 0, 0, 0])
    }

    func testTribonacciZeroCount() {
        XCTAssertEqual(tribonacci([1, 2, 3], 0), [])
    }

    func testTribonacciSeedEqualToCount() {
        XCTAssertEqual(tribonacci([5, 2, 0], 3), [5, 2, 0])
    }
}
