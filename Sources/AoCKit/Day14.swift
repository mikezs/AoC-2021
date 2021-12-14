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
        var pairsCount = polymer
            .prefix(upTo: polymer.count - 1)
            .enumerated()
            .reduce([String: Int]()) {
                let key = "\($1.element)\(polymer[$1.offset+1])"
                let current = $0[key] ?? 0
                return $0.setting(key: key, value: current + 1)
            }

        for _ in (0 ..< depth) {
            var newPairs = [String: Int]()

            for (pair, count) in pairsCount {
                let newMiddle = insertions[pair]!
                let pair1 = "\(pair.first!)\(newMiddle)"
                let pair2 = "\(newMiddle)\(pair.last!)"

                newPairs[pair1, default: 0] += count
                newPairs[pair2, default: 0] += count
            }

            pairsCount = newPairs
        }

        var initial = [Character: Int]()
        initial[polymer.first!, default: 0] += 1
        initial[polymer.last!, default: 0] += 1

        return pairsCount
            .reduce(into: initial) {
                $0[$1.key[0], default: 0] += ($1.value + 1) / 2
                $0[$1.key[1], default: 0] += ($1.value + 1) / 2
            }
    }

    public func part1() -> Int {
        let count = counts(for: input, to: 10).values
        return count.max()! - count.min()!
    }

    public func part2() -> Int {
        let count = counts(for: input, to: 40).values
        return count.max()! - count.min()!
    }
}
