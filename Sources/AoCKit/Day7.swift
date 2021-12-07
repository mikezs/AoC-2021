import Foundation

public final class Day7: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input.commaSeparatedInts
    }

    public func part1() -> Int {
        (0..<input.count).map { position in
            input.reduce(0) { $0 + abs(position - $1) }
        }
        .sorted(by: <)
            .first!
    }

    public func part2() -> Int {
        let sums: [Int] = (1...input.sorted(by: <).last!)
            .compactMap { Int($0) }
            .reduce([0]) {
                $0 + [$0.last! + $1]
            }
        
        return (0..<input.count).map { position in
            input.reduce(0) { $0 + sums[abs(position - $1)] }
        }
        .sorted(by: <)
            .first!
    }
}
