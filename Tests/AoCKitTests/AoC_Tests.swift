import XCTest
@testable import AoCKit
import class Foundation.Bundle

final class AoCTests: XCTestCase {
    static let expectedError = "Expected error to be thrown"
    static let invalidError = "Invalid error thrown"

    // MARK: - Day 1
    let day1Input = """
199
200
208
210
200
207
240
269
260
263
"""

    func testDay1Part1() {
        XCTAssertEqual(Day1(input: day1Input).part1(), 7)
    }

    func testDay1Part2() {
        XCTAssertEqual(Day1(input: day1Input).part2(), 5)
    }

    // MARK: - Day 2
    let day2Input = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

    func testDay2InitFailure() {
        do {
            _ = try Day2(input: "throw a")
            XCTFail(AoCTests.expectedError)
        } catch {
            if case AoCKit.Error.invalidInput = error {
                // Pass
            } else {
                XCTFail(AoCTests.invalidError)
            }
        }
    }

    func testDay2Part1InvalidInput() {
        do {
            _ = try Day2(input: "throw 1").part1()
            XCTFail(AoCTests.expectedError)
        } catch {
            if case Day2.Error.unrecognizedCommand = error {
                // Pass
            } else {
                XCTFail(AoCTests.invalidError)
            }
        }
    }

    func testDay2Part1() throws {
        XCTAssertEqual(try Day2(input: day2Input).part1(), 150)
    }

    func testDay2Part2InvalidInput() {
        do {
            _ = try Day2(input: "throw 2").part2()
            XCTFail(AoCTests.expectedError)
        } catch {
            if case Day2.Error.unrecognizedCommand = error {
                // Pass
            } else {
                XCTFail(AoCTests.invalidError)
            }
        }
    }

    func testDay2Part2() {
        XCTAssertEqual(try Day2(input: day2Input).part2(), 900)
    }

    // MARK: - Day 3
    let day3input = """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""

    func testDay3Part1() {
        XCTAssertEqual(try Day3(input: day3input).part1(), 198)
    }

    func testDay3Part2() {
        XCTAssertEqual(try Day3(input: day3input).part2(), 230)
    }

    // MARK: - Day 4
    let day4Input = """
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
"""

    func testDay4Part1() {
        XCTAssertEqual(Day4(input: day4Input).part1(), 4512)
    }

    func testDay4Part2() {
        XCTAssertEqual(Day4(input: day4Input).part2(), 1924)
    }

// MARK: - Day 5
    let day5Input = """
"""

    func testDay5Part1() {
        XCTAssertEqual(Day5(input: day5Input).part1(), 0)
    }

    func testDay5Part2() {
        XCTAssertEqual(Day5(input: day5Input).part2(), 0)
    }

    // MARK: - Day 6
    let day6Input = """
"""

    func testDay6Part1() {
        XCTAssertEqual(Day6(input: day6Input).part1(), 0)
    }

    func testDay6Part2() {
        XCTAssertEqual(Day6(input: day6Input).part2(), 0)
    }

    // MARK: - Day 7
    let day7Input = """
"""

    func testDay7Part1() {
        XCTAssertEqual(Day7(input: day7Input).part1(), 0)
    }

    func testDay7Part2() {
        XCTAssertEqual(Day7(input: day7Input).part2(), 0)
    }

    // MARK: - Day 8
    let day8Input = """
"""

    func testDay8Part1() {
        XCTAssertEqual(Day8(input: day8Input).part1(), 0)
    }

    func testDay8Part2() {
        XCTAssertEqual(Day8(input: day8Input).part2(), 0)
    }

    // MARK: - Day 9
    let day9Input = """
"""

    func testDay9Part1() {
        XCTAssertEqual(Day9(input: day9Input).part1(), 0)
    }

    func testDay9Part2() {
        XCTAssertEqual(Day9(input: day9Input).part2(), 0)
    }

    let day10Input = """
"""

    func testDay10Part1() {
        XCTAssertEqual(Day10(input: day10Input).part1(), 0)
    }

    func testDay10Part2() {
        XCTAssertEqual(Day10(input: day10Input).part2(), 0)
    }

    let day11Input = """
"""

    func testDay11Part1() {
        XCTAssertEqual(Day11(input: day11Input).part1(), 0)
    }

    func testDay11Part2() {
        XCTAssertEqual(Day11(input: day11Input).part2(), 0)
    }

    let day12Input = """
"""

    func testDay12Part1() {
        XCTAssertEqual(Day12(input: day12Input).part1(), 0)
    }

    func testDay12Part2() {
        XCTAssertEqual(Day12(input: day12Input).part2(), 0)
    }

    let day13Input = """
"""

    func testDay13Part1() {
        XCTAssertEqual(Day13(input: day13Input).part1(), 0)
    }

    func testDay13Part2() {
        XCTAssertEqual(Day13(input: day13Input).part2(), 0)
    }

    let day14Input = """
"""

    func testDay14Part1() {
        XCTAssertEqual(Day14(input: day14Input).part1(), 0)
    }

    func testDay14Part2() {
        XCTAssertEqual(Day14(input: day14Input).part2(), 0)
    }

    let day15Input = """
"""

    func testDay15Part1() {
        XCTAssertEqual(Day15(input: day15Input).part1(), 0)
    }

    func testDay15Part2() {
        XCTAssertEqual(Day15(input: day15Input).part2(), 0)
    }

    let day16Part1Input = """
"""

    func testDay16Part1() {
        XCTAssertEqual(Day16(input: day16Part1Input).part1(), 0)
    }

    func testDay16Part2() {
        XCTAssertEqual(Day16(input: day16Part1Input).part2(), 0)
    }

    let day17Input = """
"""

    func testDay17Part1() {
        XCTAssertEqual(Day17(input: day17Input).part1(), 0)
    }

    func testDay17Part2() {
        XCTAssertEqual(Day17(input: day17Input).part2(), 0)
    }

    let day18Input = """
"""

    func testDay18Part1() {
        XCTAssertEqual(Day18(input: day18Input).part1(), 0)
    }

    func testDay18Part2() {
        XCTAssertEqual(Day18(input: day18Input).part2(), 0)
    }

    let day19Input = """
"""

    func testDay19Part1() {
        XCTAssertEqual(Day19(input: day19Input).part1(), 0)
    }

    func testDay19Part2() {
        XCTAssertEqual(Day19(input: day19Input).part2(), 0)
    }

    let day20Input = """
"""

    func testDay20Part1() {
        XCTAssertEqual(Day20(input: day20Input).part1(), 0)
    }

    func testDay20Part2() {
        XCTAssertEqual(Day20(input: day20Input).part2(), 0)
    }

    let day21Input = """
"""

    func testDay21Part1() {
        XCTAssertEqual(Day21(input: day21Input).part1(), 0)
    }

    func testDay21Part2() {
        XCTAssertEqual(Day21(input: day21Input).part2(), 0)
    }

    let day22Input = """
"""

    func testDay22Part1() {
        XCTAssertEqual(Day22(input: day22Input).part1(), 0)
    }

    func testDay22Part2() {
        XCTAssertEqual(Day22(input: day22Input).part2(), 0)
    }

    let day23Input = """
"""

    func testDay23Part1() {
        XCTAssertEqual(Day23(input: day23Input).part1(), 0)
    }

    func testDay23Part2() {
        XCTAssertEqual(Day23(input: day23Input).part2(), 0)
    }

    let day24Input = """
"""

    func testDay24Part1() {
        XCTAssertEqual(Day24(input: day24Input).part1(), 0)
    }

    func testDay24Part2() {
        XCTAssertEqual(Day24(input: day24Input).part2(), 0)
    }

    let day25Input = """
"""

    func testDay25Part1() {
        XCTAssertEqual(Day25(input: day25Input).part1(), 0)
    }

    func testDay25Part2() {
        XCTAssertEqual(Day25(input: day25Input).part2(), 0)
    }
}
