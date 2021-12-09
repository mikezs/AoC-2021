import Foundation

public final class Day9: Day {
    let input: [[Int]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.compactMap { Int(String($0)) } }
    }

    func lowPoints() -> [(Int, Int)] {
        var lowPoints = [(Int, Int)]()

        for x in (0..<input[0].count) {
            for y in (0..<input.count) {
                let current = input[y][x]
                var lowest = true

                testloop:
                for xadj in [-1, 0, 1] where x + xadj >= 0 && x + xadj < input[0].count {
                    for yadj in [-1, 0, 1] where y + yadj >= 0 && y + yadj < input.count && !(xadj == 0 && yadj == 0) {
                        if current >= input[y+yadj][x+xadj] {
                            lowest = false
                            break testloop
                        }
                    }
                }

                if lowest {
                    lowPoints.append((x, y))
                }
            }
        }

        return lowPoints
    }

    func validAdjacentPositions(for: (Int, Int)) -> [(Int, Int)] {
        var positions = [(Int, Int)]()

        return positions
    }

    public func part1() -> Int {
        lowPoints().map { input[$0.1][$0.0] + 1 }.reduce(0, +)
    }

    public func part2() -> Int {
        lowPoints().map { validAdjacentPositions(for: $0).count + 1 }.sorted(by: >).prefix(3).reduce(0, *)
    }
}
