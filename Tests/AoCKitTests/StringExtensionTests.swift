import XCTest
@testable import AoCKit

final class StringExtensionTests: XCTestCase {
    func testTrimmedLines() {
        let lines = """
one
two
three
"""
        XCTAssertEqual(lines.trimmedLines, ["one", "two", "three"])
    }

    func testTrimmedInts() {
        let lines = """
1
2
3
"""
        XCTAssertEqual(lines.trimmedInts, [1, 2, 3])
    }
    
    func testCommaSeparatedInts() {
        let line = """
1,2,3,4,5
"""
        XCTAssertEqual(line.commaSeparatedInts, [1, 2, 3, 4, 5])
    }

    func testBinaryAsInt() {
        XCTAssertEqual("11111111".binaryAsInt, 255)
        XCTAssertNil("".binaryAsInt)
    }

    func testIsLowercase() {
        XCTAssertTrue("1".isLowercase)
        XCTAssertTrue("a".isLowercase)
        XCTAssertTrue("hello this is lowercase".isLowercase)
        XCTAssertFalse("A".isLowercase)
        XCTAssertFalse("This is not all lowercase".isLowercase)
    }

    func testReplaceIndexWithCharacter() {
        XCTAssertEqual("0123456789".replacing(at: 1, with: "x"), "0x23456789")
    }

    func testReplacingPairs() {
        XCTAssertEqual("00001111".replacing(pairs: [("0","1"),("1","0")]), "11110000")
    }

    func testStringCharacterAtOffset() {
        XCTAssertEqual("abc"[1], "b")
    }
}
