//
//  BracketValidatorViewTests.swift.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class BracketValidatorViewTests: XCTestCase {
    func testBracketPairs() {
        XCTAssertTrue(isValidBrackets("()"))
        XCTAssertFalse(isValidBrackets("([]]"))
        XCTAssertTrue(isValidBrackets("([{}])"))
        XCTAssertFalse(isValidBrackets("([[{}]]]"))
        XCTAssertFalse(isValidBrackets(")"))
        XCTAssertFalse(isValidBrackets("(]}])"))
        XCTAssertFalse(isValidBrackets("([)]"))
        XCTAssertFalse(isValidBrackets("{"))
    }
}
