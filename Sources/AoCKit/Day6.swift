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

        input.forEach {
            daysRemaining[$0] += 1
        }

        (1...days).forEach { _ in
            var newDaysRemaining = daysRemaining

            (1...8).forEach {
                newDaysRemaining[$0 - 1] = daysRemaining[$0]
            }

            newDaysRemaining[8] = daysRemaining[0]
            newDaysRemaining[6] += daysRemaining[0]

            daysRemaining = newDaysRemaining
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
