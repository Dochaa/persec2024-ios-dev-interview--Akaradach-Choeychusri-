//
//  SortDigitsDescendingTests.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class SortDigitsDescendingTests: XCTestCase {
    func testSortDigitsDescending() {
        XCTAssertEqual(sortDigitsDescending(3008), 8300)
        XCTAssertEqual(sortDigitsDescending(1989), 9981)
        XCTAssertEqual(sortDigitsDescending(2679), 9762)
        XCTAssertEqual(sortDigitsDescending(9163), 9631)
    }

    func testSingleDigit() {
        XCTAssertEqual(sortDigitsDescending(5), 5)
    }

    func testRepeatedDigits() {
        XCTAssertEqual(sortDigitsDescending(1111), 1111)
        XCTAssertEqual(sortDigitsDescending(2220), 2220)
    }
}
