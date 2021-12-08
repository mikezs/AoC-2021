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
            let one: Set<Character> = Set(line.0.filter { $0.count == 2 }.first!)
            let seven: Set<Character> = Set(line.0.filter { $0.count == 3 }.first!)
            let four: Set<Character> = Set(line.0.filter { $0.count == 4 }.first!)
            let eight: Set<Character> = Set(line.0.filter { $0.count == 7 }.first!)

            var fiveSegment: [Set<Character>] = line.0.filter { $0.count == 5 }.map { Set($0) }
            var sixSegment: [Set<Character>] = line.0.filter { $0.count == 6 }.map { Set($0) }

            let nine: Set<Character> = sixSegment.filter { four.isSubset(of: $0) }.first!
            sixSegment.removeAll { $0 == nine }
            let two: Set<Character> = fiveSegment.filter { !Set($0).isSubset(of: nine) }.first!
            fiveSegment.removeAll { $0 == two }

            let zero: Set<Character> = sixSegment.filter { $0.subtracting(one).count == 4 }.first!
            let six: Set<Character> = sixSegment.filter { $0.subtracting(one).count == 5 }.first!

            let three: Set<Character> = fiveSegment.filter { $0.subtracting(one).count == 3 }.first!
            let five: Set<Character> = fiveSegment.filter { $0.subtracting(one).count == 4 }.first!

            var result = ""

            for digit in line.1 {
                let set: Set<Character> = Set(digit)

                if one == set { result += "1" }
                else if two == set { result += "2" }
                else if three == set { result += "3" }
                else if four == set { result += "4" }
                else if five == set { result += "5" }
                else if six == set { result += "6" }
                else if seven == set { result += "7" }
                else if eight == set { result += "8" }
                else if nine == set { result += "9" }
                else if zero == set { result += "0" }
            }

            total += Int(result)!
        }

        return total
    }
}
