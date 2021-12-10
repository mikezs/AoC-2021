import Foundation

public final class Day10: Day {
    enum Error: Swift.Error {
        case illigalCharacter(Character)
    }

    let input: [[Character]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.map { $0 } }
    }

    func remaining(of line: [Character]) throws -> [Character] {
        var stack = [Character]()

        for char in line {
            switch char {
            case ")":
                if stack.last != "(" {
                    throw Error.illigalCharacter(char)
                } else {
                    stack.removeLast()
                }
            case "]":
                if stack.last != "[" {
                    throw Error.illigalCharacter(char)
                } else {
                    stack.removeLast()
                }
            case "}":
                if stack.last != "{" {
                    throw Error.illigalCharacter(char)
                } else {
                    stack.removeLast()
                }
            case ">":
                if stack.last != "<" {
                    throw Error.illigalCharacter(char)
                } else {
                    stack.removeLast()
                }
            case "(", "[", "{", "<": stack.append(char)
            default: return []
            }
        }

        return stack
    }

    public func part1() -> Int {
        var illigals = [Character]()

        for line in input {
            do {
                _ = try remaining(of: line)
            } catch let Error.illigalCharacter(char) {
                illigals.append(char)
            } catch {
                return 0
            }
        }

        return illigals.map {
            switch $0 {
            case ")": return 3
            case "]": return 57
            case "}": return 1197
            case ">": return 25137
            default: return 0
            }
        }.reduce(0, +)
    }

    public func part2() -> Int {
        return 0
    }
}
