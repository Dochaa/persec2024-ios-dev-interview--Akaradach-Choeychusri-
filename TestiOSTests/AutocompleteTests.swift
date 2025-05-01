//
//  AutocompleteTests.swift
//  TestiOS
//
//  Created by Akaradach Choeychusri on 1/5/2568 BE.
//

import XCTest
@testable import TestiOS

final class AutocompleteTests: XCTestCase {
    func testBasicAutocomplete() {
        let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
        let result = autocomplete(search: "th", items: items, maxResult: 2)
        XCTAssertEqual(result, ["Think", "Mother"])
    }
    
    func testCaseInsensitive() {
        let items = ["banana", "BananaTree", "Bandana", "cabana"]
        let result = autocomplete(search: "BAN", items: items, maxResult: 3)
        XCTAssertEqual(result, ["banana", "BananaTree", "Bandana"])
    }
    
    func testNoMatch() {
        let result = autocomplete(search: "xyz", items: ["apple", "banana"], maxResult: 5)
        XCTAssertEqual(result, [])
    }
    
    func testAllMatches() {
        let result = autocomplete(search: "a", items: ["apple", "banana", "carrot"], maxResult: 10)
        XCTAssertEqual(result, ["apple", "banana", "carrot"])
    }
}

