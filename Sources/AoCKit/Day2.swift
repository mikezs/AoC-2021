import Foundation

public final class Day2: Day {
    let input: [(String, Int)]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap {
            let parts = $0.components(separatedBy: " ")
            guard let int = Int(parts[1]) else { fatalError() }
            return (parts[0], int)
        }
    }

    public func part1() -> Int {
        var horizontal = 0
        var depth = 0

        input.forEach {
            if $0.0 == "forward" {
                horizontal += $0.1
            } else if $0.0 == "down" {
                depth += $0.1
            } else if $0.0 == "up" {
                depth -= $0.1
            } else {
                fatalError()
            }
        }

        return horizontal * depth
    }

    public func part2() -> Int {
        var horizontal = 0
        var depth = 0
        var aim = 0

        input.forEach {
            if $0.0 == "forward" {
                horizontal += $0.1
                depth += aim * $0.1
            } else if $0.0 == "down" {
                aim += $0.1
            } else if $0.0 == "up" {
                aim -= $0.1
            } else {
                fatalError()
            }
        }

        return horizontal * depth
    }
}
