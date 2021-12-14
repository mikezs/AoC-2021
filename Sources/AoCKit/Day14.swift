import Foundation

public final class Day14: Day {
    let input: [Character]
    let insertions: [String: Character]

    public init(input: String) {
        let parts = input.trimmingCharacters(in: .newlines).components(separatedBy: "\n\n")
        self.input = Array(parts[0])
        insertions = parts[1]
            .components(separatedBy: .newlines)
            .reduce([String: Character]()) {
                let insertion = $1.components(separatedBy: " -> ")
                return $0.setting(key: insertion[0], value: insertion[1][0])
            }
    }

    func counts(for polymer: [Character], to depth: Int) -> [Character: Int] {
        var polymer = polymer

        for _ in (0..<depth) {
            var newPolymer = polymer

            for pos in stride(from: polymer.count - 1, to: 0, by: -1) {
                newPolymer.insert(insertions["\(polymer[pos-1])\(polymer[pos])"]!, at: pos)
            }

            polymer = newPolymer
        }

        let counts = polymer.counts
        return counts
    }

    public func part1() -> Int {
        let count = counts(for: input, to: 10).values
        return count.max()! - count.min()!
    }

    public func part2() -> Int {
        0
    }
}
