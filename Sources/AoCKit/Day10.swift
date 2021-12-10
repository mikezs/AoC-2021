import Foundation

private extension Array where Element: Equatable {
    /// Returns array with last element removed if it matches `last`, nil otherwise
    func removing(last item: Element) -> [Element]? {
        last == item ? Array(prefix(upTo: count - 1)) : nil
    }
}

public final class Day10: Day {
    enum Error: Swift.Error {
        case unrecognizedCharacter
        case illigalCharacter(Character)
    }

    let input: [[Character]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.map { $0 } }
    }

    static func remaining(of line: [Character]) throws -> [Character] {
        try line
            .reduce([Character](), {
                let possibleResult: [Character]?

                switch $1 {
                case "(", "[", "{", "<": possibleResult = $0 + [$1]
                case ")": possibleResult = $0.removing(last: "(")
                case "]": possibleResult = $0.removing(last: "[")
                case "}": possibleResult = $0.removing(last: "{")
                case ">": possibleResult = $0.removing(last: "<")
                default: throw Error.unrecognizedCharacter
                }

                guard let result = possibleResult else { throw Error.illigalCharacter($1) }
                return result
            })
    }

    public func part1() -> Int {
        input
            .compactMap { line -> Character? in
                do {
                    _ = try Day10.remaining(of: line)
                } catch let Error.illigalCharacter(char) {
                    return char
                } catch {
                    return nil
                }

                return nil
            }
            .map {
                switch $0 {
                case ")": return 3
                case "]": return 57
                case "}": return 1197
                case ">": return 25137
                default: return 0
                }
            }
            .reduce(0, +)
    }

    public func part2() -> Int {
        let incompleteLines = input
            .compactMap { try? Day10.remaining(of: $0) }
            .filter { !$0.isEmpty }
            .map {
                $0
                    .reversed()
                    .map { char -> Character in
                        switch char {
                        case "(": return ")"
                        case "[": return "]"
                        case "{": return "}"
                        case "<": return ">"
                        default: return " "
                        }
                    }
            }
            .map { line -> Int in
                line.reduce(0, { ($0 * 5) + Day10.score(for: $1) })
            }
            .sorted()

        return incompleteLines[incompleteLines.count / 2]
    }

    static func score(for char: Character) -> Int {
        ([")","]","}",">"].firstIndex(of: char) ?? -1) + 1
    }
}
