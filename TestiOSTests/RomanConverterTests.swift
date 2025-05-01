//
//  Untitled.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class RomanConverterTests: XCTestCase {
    func testIntToRoman() {
        XCTAssertEqual(intToRoman(1989), "MCMLXXXIX")
        XCTAssertEqual(intToRoman(2000), "MM")
        XCTAssertEqual(intToRoman(68), "LXVIII")
        XCTAssertEqual(intToRoman(109), "CIX")
        XCTAssertEqual(intToRoman(4), "IV")
    }

    func testRomanToInt() {
        XCTAssertEqual(romanToInt("MCMLXXXIX"), 1989)
        XCTAssertEqual(romanToInt("MM"), 2000)
        XCTAssertEqual(romanToInt("LXVIII"), 68)
        XCTAssertEqual(romanToInt("CIX"), 109)
        XCTAssertEqual(romanToInt("IV"), 4)
    }
}
