import XCTest
@testable import AoCKit

final class ExtensionTests: XCTestCase {
    func testStringMatchWithRegexOneLine() {
        let matches = "Hello, Tests. My name is Mike"
            .matches(for: "^Hello, (.*?)\\. My name is (.*)$")

        XCTAssertEqual(matches, [["Tests", "Mike"]])
    }
}
