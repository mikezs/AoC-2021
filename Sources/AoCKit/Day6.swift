import Foundation

public final class Day6: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input
            .trimmingCharacters(in: .newlines)
            .components(separatedBy: ",")
            .compactMap { Int($0) }
    }

    public func calculate(days: Int) -> Int {
        var daysRemaining = [Int](repeating: 0, count: 9)

        input.forEach { daysRemaining[$0] += 1 }

        (1...days).forEach { _ in
            let newFish = daysRemaining.remove(at: 0)
            daysRemaining.append(newFish)
            daysRemaining[6] += newFish
        }

        return daysRemaining.reduce(0, +)
    }

    public func part1() -> Int {
        calculate(days: 80)
    }

    public func part2() -> Int {
        calculate(days: 256)
    }
}
