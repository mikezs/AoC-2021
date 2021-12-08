import Foundation

public final class Day8: Day {
    let input: [([String], [String])]

    public init(input: String) {
        self.input = input.trimmedLines.map {
            let parts = $0.components(separatedBy: " | ")
            return (parts[0].components(separatedBy: .whitespaces), parts[1].components(separatedBy: .whitespaces))
        }
    }

    public func part1() -> Int {
        input
            .map { $0.1.filter { [2, 3, 4, 7].contains($0.count) }.count }
            .reduce(0, +)
    }

    public func part2() -> Int {
        return 0
    }
}
