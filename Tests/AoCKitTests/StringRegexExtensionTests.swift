import XCTest
@testable import AoCKit

final class StringRegexExtensionTests: XCTestCase {
    func testRegexReplaceFirst() throws {
        let replaced = try "Hello, 123. My name is 456"
            .using(regex: "([0-9]+).+?([0-9]+)") { matches in
                return matches.joined()
            }

        XCTAssertEqual(replaced, "Hello, 123456")

        do {
            _ = try "".using(regex: "[0-9]") { $0[0] }
            XCTFail("Expected error to be thrown")
        } catch {
            if case String.Error.noMatches = error {
                // Pass
            } else {
                XCTFail("Incorrect error thrown")
            }
        }
    }

    func testStringMatchWithRegexOneLine() {
        let matches = "Hello, Tests. My name is Mike"
            .matches(for: "^Hello, (.*?)\\. My name is (.*)$")

        XCTAssertEqual(matches, [["Tests", "Mike"]])
    }

    func testStringContainsRegexOperator() {
        XCTAssertTrue("abc123" =¬ "[0-9]")
        XCTAssertTrue("abc123" =¬ "c")
        XCTAssertTrue("abc123" =¬ ".")
        XCTAssertFalse("abc" =¬ "[0-9]")
        XCTAssertFalse("abc" =¬ "1")
        XCTAssertFalse("" =¬ "")
    }
}
