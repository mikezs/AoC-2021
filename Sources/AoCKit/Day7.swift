import Foundation

public final class Day7: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input
            .trimmingCharacters(in: .newlines)
            .components(separatedBy: ",")
            .compactMap { Int($0) }
    }

    public func part1() -> Int {
        (0..<input.count).map { position in
            input.reduce(0) { $0 + abs(position - $1) }
        }
        .sorted(by: <)
            .first!
    }

    public func part2() -> Int {
        (0..<input.count).map { position in
            input.reduce(0) { $0 + abs(position - $1).sumTo }
        }
        .sorted(by: <)
            .first!
    }
}

extension Int {
    var sumTo: Int {
        self > 1 ? (1...self).compactMap { Int($0) }.reduce(0, +) : self
    }
}
