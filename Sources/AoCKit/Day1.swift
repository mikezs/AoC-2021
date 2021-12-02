import Foundation
import Algorithms

public final class Day1: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Int($0) }
    }

    public func part1() -> Int {
        incrementingValues(input: input)
    }

    public func part2() -> Int {
        incrementingValues(input:
                            input
                                .windows(ofCount: 3)
                                .map { $0.reduce(0, +) }
        )
    }

    private func incrementingValues(input: [Int]) -> Int {
        input
            .enumerated()
            .dropLast()
            .filter { $0.element < input[$0.offset + 1] }
            .count
    }
}
