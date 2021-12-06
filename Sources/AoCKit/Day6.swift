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

        for _ in 1...days {
            var newDaysRemaining = daysRemaining

            (1...8).forEach {
                newDaysRemaining[$0 - 1] = daysRemaining[$0]
            }

            newDaysRemaining[6] += daysRemaining[0]
            newDaysRemaining[8] = daysRemaining[0]

            daysRemaining = newDaysRemaining
        }

        return daysRemaining.reduce(0, +)
    }

    public func part1() -> Int {
        var state = input

        for count in 0..<80 {
            var newFish = 0
            var newState = state

            for (index, age) in state.enumerated() {
                if age == 0 {
                    newFish += 1
                    newState[index] = 6
                } else {
                    newState[index] -= 1
                }
            }

            state = newState

            state += [Int](repeating: 8, count: newFish)
            print(count)
        }

        return state.count
    }

    public func part2() -> Int {
        calculate(days: 256)
    }
}
