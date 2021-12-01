import Foundation

public final class Day1: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Int($0) }
    }

    public func part1() -> Int {
        var increases = 0

        for (index, depth) in input.enumerated() where index < input.count - 1 {

            let nextDepth = input[index + 1]

            if depth < nextDepth {
                increases += 1
            }
        }

        return increases
    }

    public func part2() -> Int {
        var increases = 0

        for (index, _) in input.enumerated() where index < input.count - 3 {

            let window = self.window(at: index)
            let nextWindow = self.window(at: index + 1)

            if window < nextWindow {
                increases += 1
            }
        }

        return increases
    }

    func window(at index: Int) -> Int {
        guard index < input.count - 2 else { fatalError("index out of range") }

        return input[index...index+2].reduce (0, +)
    }
}
