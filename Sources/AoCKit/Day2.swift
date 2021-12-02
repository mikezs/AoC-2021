import Foundation

public final class Day2: Day {
    let input: [(direction: String, amount: Int)]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap {
            let parts = $0.components(separatedBy: " ")
            guard parts.count == 2, let int = Int(parts[1]) else { fatalError() }
            return (direction: parts[0], amount: int)
        }
    }

    public func part1() -> Int {
        var horizontal = 0
        var depth = 0

        input.forEach { command in
            switch command.direction {
            case "forward":
                horizontal += command.amount
            case "down":
                depth += command.amount
            case "up":
                depth -= command.amount
            default:
                fatalError("unrecognised command")
            }
        }

        return horizontal * depth
    }

    public func part2() -> Int {
        var horizontal = 0
        var depth = 0
        var aim = 0

        input.forEach { command in
            switch command.direction {
            case "forward":
                horizontal += command.amount
                depth += aim * command.amount
            case "down":
                aim += command.amount
            case "up":
                aim -= command.amount
            default:
                fatalError("unrecognised command")
            }
        }

        return horizontal * depth
    }
}
