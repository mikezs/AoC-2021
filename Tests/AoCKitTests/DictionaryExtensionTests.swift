import XCTest
@testable import AoCKit

final class DictionaryExtensionTests: XCTestCase {
    func testSetDictionaryElementCopy() {
        let dict = ["a": 1, "b": 2]
        XCTAssertEqual(dict.setting(key: "c", value: 3), ["a": 1, "b": 2, "c": 3])
        XCTAssertEqual(dict.setting(key: "b", value: 3), ["a": 1, "b": 3])
    }
}
