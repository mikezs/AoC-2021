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
        var total = 0

        for line in input {
            var chars = [Set<Character>](repeating: [], count: 10)

            chars[1] = Set(line.0.first { $0.count == 2 }!)
            chars[4] = Set(line.0.first { $0.count == 4 }!)
            chars[7] = Set(line.0.first { $0.count == 3 }!)
            chars[8] = Set(line.0.first { $0.count == 7 }!)

            var fiveSegment = line.0.filter { $0.count == 5 }.map { Set($0) }
            var sixSegment = line.0.filter { $0.count == 6 }.map { Set($0) }

            chars[9] = sixSegment.first { chars[4] < $0 }!
            sixSegment.removeAll { $0 == chars[9] }

            chars[2] = fiveSegment.first { !($0 < chars[9]) }!
            fiveSegment.removeAll { $0 == chars[2] }

            chars[3] = fiveSegment.first { ($0 - chars[1]).count == 3 }!
            chars[5] = fiveSegment.first { ($0 - chars[1]).count == 4 }!
            chars[0] = sixSegment.first { ($0 - chars[1]).count == 4 }!
            chars[6] = sixSegment.first { ($0 - chars[1]).count == 5 }!

            total += Int(line.1
                .map { Set($0) }
                .compactMap { seg in chars.firstIndex(where: { seg == $0 }) }
                .reduce("") { "\($0)\($1)" })!
        }

        return total
    }
}

fileprivate extension Set {
    static func - (lhs: Set, rhs: Set) -> Set {
        return lhs.subtracting(rhs)
    }
    static func < (lhs: Set, rhs: Set) -> Bool {
        return lhs.isSubset(of: rhs)
    }
}
