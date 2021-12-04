import Foundation

public final class Day4: Day {
    typealias Board = [[Int]]
    let numbers: [Int]
    let boards: [Board]

    public init(input: String) {
        let input = input.trimmingCharacters(in: .newlines).components(separatedBy: "\n\n")
        
        numbers = input[0]
            .components(separatedBy: ",")
            .compactMap {
                Int($0)
            }
        
        boards = input[1 ..< input.count]
            .map {
                $0
                    .components(separatedBy: .newlines)
                    .map {
                        $0.components(separatedBy: .whitespaces).compactMap { Int($0) }
                    }
            }
    }

    public func part1() -> Int {
        for number in 0 ..< numbers.count {
            let drawn = Set(numbers[0...number])
            
            for board in boards {
                for row in (0 ..< board.count).map( {Set(board[$0])}) {
                    if row.isSubset(of: drawn) {
                        let unmarkedSum = Set(board.flatMap { $0 }).subtracting(drawn).reduce(0, +)
                        return unmarkedSum * numbers[number]
                    }
                }
                for column in (0..<board[0].count).map( { Set(board.verticalSlice($0))}) {
                    if column.isSubset(of: drawn) {
                        let unmarkedSum = Set(board.flatMap { $0 }).subtracting(drawn).reduce(0, +)
                        return unmarkedSum * numbers[number]
                    }
                }
            }
        }
        
        return 0
    }

    public func part2() -> Int {
        var boardsLeft = boards
        
        for number in 0 ..< numbers.count {
            let drawn = Set(numbers[0...number])
            
            var i = boardsLeft.count - 1
            
        boardloop:
            while i >= 0 {
                let board = boardsLeft[i]
                
                for row in (0 ..< board.count).map({Set(board[$0])}) where row.isSubset(of: drawn) {
                    if boardsLeft.count == 1 {
                        let unmarkedSum = Set(board.flatMap { $0 }).subtracting(drawn).reduce(0, +)
                        return unmarkedSum * numbers[number]
                    } else {
                        boardsLeft.remove(at: i)
                        i -= 1
                        continue boardloop
                    }
                }
                for column in (0..<board[0].count).map({ Set(board.verticalSlice($0))}) where column.isSubset(of: drawn) {
                    if boardsLeft.count == 1 {
                        let unmarkedSum = Set(board.flatMap { $0 }).subtracting(drawn).reduce(0, +)
                        return unmarkedSum * numbers[number]
                    } else {
                        boardsLeft.remove(at: i)
                        i -= 1
                        continue boardloop
                    }
                }
                
                i -= 1
            }
        }
        
        return 0
    }
}
