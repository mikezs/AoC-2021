import Algorithms
import Foundation

public final class Day13: Day {
    struct Dot: Hashable {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    typealias Fold = (axis: Character, pos: Int)
    let sheet: [Dot]
    let folds: [Fold]

    public init(input: String) {
        let parts = input
            .trimmingCharacters(in: .newlines)
            .components(separatedBy: "\n\n")

        self.sheet = parts[0]
            .components(separatedBy: .newlines)
            .map {
                let coordinates = $0.components(separatedBy: ",")
                return Dot(Int(coordinates[0])!, Int(coordinates[1])!)
            }
        self.folds = parts[1]
            .components(separatedBy: .newlines)
            .map {
                let instructions = $0.components(separatedBy: "=")
                return (instructions[0].last!, Int(instructions[1])!)
            }
    }

    func fold(sheet: [Dot], along fold: Fold) -> [Dot] {
        var newSheet = Set<Dot>()

        if fold.axis == "y" {
            sheet.forEach { dot in
                if dot.y < fold.pos {
                    newSheet.insert(dot)
                } else {
                    let distanceToMove = (dot.y - fold.pos) * 2
                    newSheet.insert(Dot(dot.x, dot.y - distanceToMove))
                }
            }
        } else if fold.axis == "x" {
            sheet.forEach { dot in
                if dot.x < fold.pos {
                    newSheet.insert(dot)
                } else {
                    let distanceToMove = (dot.x - fold.pos) * 2
                    newSheet.insert(Dot(dot.x - distanceToMove, dot.y))
                }
            }
        }

        return Array(newSheet)
    }

    public func part1() -> Int {
        fold(sheet: sheet, along: folds.first!).count
    }

    public func part2() -> Int {
        var sheet = self.sheet

        folds.forEach {
            sheet = fold(sheet: sheet, along: $0)
        }

        let maxX = sheet.map { $0.x }.max()!
        let maxY = sheet.map { $0.y }.max()!

        for y in 0...maxY {
            var line = ""

            for x in 0...maxX {
                if sheet.contains(where: { $0.x == x && $0.y == y }) {
                    line += "#"
                } else {
                    line += "."
                }
            }

            print(line)
        }

        return sheet.count
    }
}
