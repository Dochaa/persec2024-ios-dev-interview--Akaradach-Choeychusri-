//
//  SortedStringArrayTests.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class SortedStringArrayTests: XCTestCase {
    func testExample1() {
        let input = ["TH19", "SG20", "TH2"]
        let expected = ["SG20", "TH2", "TH19"]
        XCTAssertEqual(sortedBySuffixNumber(input), expected)
    }

    func testExample2() {
        let input = ["TH10", "TH3Netflix", "TH1", "TH7"]
        let expected = ["TH1", "TH3Netflix", "TH7", "TH10"]
        XCTAssertEqual(sortedBySuffixNumber(input), expected)
    }

    func testMixedPrefixes() {
        let input = ["US5", "CA2", "US1"]
        let expected = ["CA2", "US1", "US5"]
        XCTAssertEqual(sortedBySuffixNumber(input), expected)
    }
}
