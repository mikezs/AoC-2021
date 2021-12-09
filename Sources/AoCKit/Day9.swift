import Foundation

public final class Day9: Day {
    typealias Position = (x: Int, y: Int)
    let input: [[Int]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.compactMap { Int(String($0)) } }
    }

    func validAdjacentPositions(for pos: Position) -> [Position] {
        [(pos.x-1, pos.y),
         (pos.x+1, pos.y),
         (pos.x, pos.y-1),
         (pos.x, pos.y+1)].filter {
            $0.x >= 0 && $0.x < input[0].count &&
            $0.y >= 0 && $0.y < input.count
        }
    }

    func lowPoints() -> [Position] {
        var lowPoints = [Position]()

        for x in (0..<input[0].count) {
            for y in (0..<input.count) {
                let position = (x, y)
                let current = input[y][x]
                var lowest = true

                for pos in validAdjacentPositions(for: position) where current >= input[pos.y][pos.x] {
                    lowest = false
                    break
                }

                if lowest {
                    lowPoints.append(position)
                }
            }
        }

        return lowPoints
    }

    func calculateBasin(for pos: Position, basin: inout [Position]) {
        for p in validAdjacentPositions(for: pos) {
            if input[p.y][p.x] != 9 && !basin.contains(where: { $0 == p }) {
                basin.append(p)
                calculateBasin(for: p, basin: &basin)
            }
        }
    }

    public func part1() -> Int {
        lowPoints()
            .map { input[$0.1][$0.0] + 1 }
            .reduce(0, +)
    }

    public func part2() -> Int {
        lowPoints()
            .map {
                var basin = [$0]
                calculateBasin(for: $0, basin: &basin)
                return basin.count
            }
            .sorted(by: >)
            .prefix(3)
            .reduce(1, *)
    }
}
