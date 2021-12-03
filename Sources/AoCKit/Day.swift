import Foundation

enum Error: Swift.Error {
    case invalidInput
}

public protocol Day {
    init(input: String) throws
    func part1() throws -> Int
    func part2() throws -> Int
}
