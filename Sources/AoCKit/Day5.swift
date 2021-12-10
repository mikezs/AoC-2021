import Foundation

public final class Day5: Day {
    typealias Line = ((x: Int, y: Int),(x: Int, y: Int))
    let input: [Line]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap {
            let parts = $0.split(separator: " ")
            let start = parts[0].split(separator: ",")
            let end = parts[2].split(separator: ",")
            
            return ((Int(start[0])!, Int(start[1])!), (Int(end[0])!, Int(end[1])!))
        }
    }

    public func part1() -> Int {
        let lines = input.filter {
            $0.0.x == $0.1.x || $0.0.y == $0.1.y
        }
        
        var maxX = 0
        var maxY = 0
        
        for line in lines {
            maxX = max(max(line.0.x, line.1.x) , maxX)
            maxY = max(max(line.0.y, line.1.y) , maxY)
        }
        
        var grid = [[Int]](repeating: [Int](repeating: 0, count: maxX + 1), count: maxY + 1)
        
        for line in lines {
            if line.0.x == line.1.x {
                for y in (min(line.0.y, line.1.y) ... max(line.0.y, line.1.y)) {
                    grid[y][line.0.x] += 1
                }
            } else if line.0.y == line.1.y {
                for x in (min(line.0.x, line.1.x) ... max(line.0.x, line.1.x)) {
                    grid[line.0.y][x] += 1
                }
            }
        }
        
        return grid
            .flatMap { $0 }
            .filter { $0 > 1 }
            .count
    }

    public func part2() -> Int {
        var maxX = 0
        var maxY = 0
        
        for line in input {
            maxX = max(max(line.0.x, line.1.x) , maxX)
            maxY = max(max(line.0.y, line.1.y) , maxY)
        }
        
        var grid = [[Int]](repeating: [Int](repeating: 0, count: maxX + 1), count: maxY + 1)
        
        for line in input {
            let xDirection = (line.1.x - line.0.x).signum()
            let yDirection = (line.1.y - line.0.y).signum()
            
            let xSequence = xDirection == 0 ? [Int](repeating: line.0.x, count: abs(line.0.y - line.1.y) + 1) : Array(stride(from: line.0.x, through: line.1.x, by: xDirection))
            let ySequence = yDirection == 0 ? [Int](repeating: line.0.y, count: abs(line.0.x - line.1.x) + 1) : Array(stride(from: line.0.y, through: line.1.y, by: yDirection))
            
            for (x,y) in zip(xSequence, ySequence) {
                grid[y][x] += 1
            }
        }
        
        return grid
            .flatMap { $0 }
            .filter { $0 > 1 }
            .count
    }
}
