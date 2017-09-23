//
//  OptionalTests.swift
//  Optional
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import OptionalTests

extension OptionalTests {

	static var allTests : [(String, (OptionalTests) -> () throws -> Void)] {
		return [
			("testCast", testCast),
			("testNone", testNone),
			("testNotNil", testNotNil),
			("testOrElse", testOrElse),
			("testSome", testSome),
			("testThrow", testThrow),
		]
	}

}

XCTMain([
	testCase(OptionalTests.allTests),
])

