import Foundation
import Algorithms

public final class Day11: Day {
    let input: [[Int]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.compactMap { Int(String($0)) } }
    }

    static func flash(x: Int, y: Int, cavern: inout [[Int]]) {
        product(-1...1, -1...1)
            .filter { dx, _ in x+dx >= 0 && x+dx < cavern[0].count }
            .filter { _, dy in y+dy >= 0 && y+dy < cavern.count }
            .forEach { dx, dy in
                cavern[y+dy][x+dx] += 1

                if cavern[y+dy][x+dx] == 10 {
                    flash(x: x+dx, y: y+dy, cavern: &cavern)
                }
            }
    }

    func iterationFlashes(cavern: inout [[Int]]) -> Int {
        var flashes = 0

        for (x, y) in product(0..<cavern[0].count, 0..<cavern.count) {
            cavern[y][x] += 1
        }

        let afterRound = cavern
        for (x, y) in product(0..<afterRound[0].count, 0..<afterRound.count) where afterRound[y][x] >= 10 {
            Day11.flash(x: x, y: y, cavern: &cavern)
        }

        for (x, y) in product(0..<cavern[0].count, 0..<cavern.count) where cavern[y][x] >= 10 {
            flashes += 1
            cavern[y][x] = 0
        }

        return flashes
    }
    public func part1() -> Int {
        var cavern = input

        return (0..<100).reduce(0, { array, _ in array + iterationFlashes(cavern: &cavern) })
    }

    public func part2() -> Int {
        var cavern = input
        var round = 0
        let target = cavern[0].count * cavern.count

        repeat {
            round += 1
        } while iterationFlashes(cavern: &cavern) != target

        return round
    }
}
