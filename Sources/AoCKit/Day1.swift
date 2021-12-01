import Foundation

public final class Day1: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Int($0) }
    }

    public func part1() -> Int {
        input
            .enumerated()
            .dropLast()
            .filter { $0.element < input[$0.offset + 1] }
            .count
    }

    public func part2() -> Int {
        Array(0 ..< input.count - 3)
            .filter { window(at: $0) < window(at: $0 + 1) }
            .count
    }

    func window(at index: Int) -> Int {
        guard index < input.count - 2 else { fatalError("index out of range") }

        return input[index ... index + 2].reduce(0, +)
    }
}
