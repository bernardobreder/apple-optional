//
//  Optional.swift
//  Optional
//
//  Created by Bernardo Breder on 15/01/17.
//
//

import XCTest
@testable import Optional

class OptionalTests: XCTestCase {

    func testOrElse() {
        XCTAssertEqual("a", (nil as String?).orElse({"a"}))
        XCTAssertEqual(true, (nil as Bool?).orElse({true}))
        XCTAssertEqual(false, (nil as Bool?).orElse({false}))
    }
    
    func testSome() {
        XCTAssertEqual("b", ("a" as String?).some({_ in "b"}))
        XCTAssertNil((nil as String?).some({_ in "b"}))
    }
    
    func testThrow() {
        XCTAssertNil(try? (nil as String?).orThrow(OptionalTestsError.test))
        XCTAssertEqual("a", try? ("a" as String?).orThrow(OptionalTestsError.test))
    }
    
    func testNone() {
        XCTAssertEqual("a", ("a" as String?).none({_ in "b"}))
        XCTAssertEqual("b", (nil as String?).none({_ in "b"}))
    }
    
    func testNotNil() {
        XCTAssertEqual((["a", "b"] as [String?]).description, (["a", nil, "b"].notnil() as [String?]).description)
    }
    
    func testCast() {
        XCTAssertEqual((["a", "b"]).description, ["a", 1, "b"].cast(String.self).description)
        XCTAssertEqual(([1]).description, ["a", 1, "b"].cast(Int.self).description)
    }

}

public enum OptionalTestsError: Error {
    case test
}
