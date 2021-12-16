import XCTest
@testable import AoCKit
import class Foundation.Bundle

final class AoCTests: XCTestCase {
    static let expectedError = "Expected error to be thrown"
    static let invalidError = "Invalid error thrown"
    static let expectedIlligalCharacter = "Expected illigal character"

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
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""

    func testDay5Part1() {
        XCTAssertEqual(Day5(input: day5Input).part1(), 5)
    }

    func testDay5Part2() {
        XCTAssertEqual(Day5(input: day5Input).part2(), 12)
    }

    // MARK: - Day 6
    let day6Input = """
3,4,3,1,2
"""

    func testDay6Part1() {
        XCTAssertEqual(Day6(input: day6Input).part1(), 5934)
    }

    func testDay6Part2() {
        XCTAssertEqual(Day6(input: day6Input).part2(), 26_984_457_539)
    }

    // MARK: - Day 7
    let day7Input = """
16,1,2,0,4,2,7,1,2,14
"""

    func testDay7Part1() {
        XCTAssertEqual(Day7(input: day7Input).part1(), 37)
    }

    func testDay7Part2() {
        XCTAssertEqual(Day7(input: day7Input).part2(), 168)
    }

    // MARK: - Day 8
    let day8Input = """
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
"""

    func testDay8Part1() {
        XCTAssertEqual(Day8(input: day8Input).part1(), 26)
    }

    func testDay8Part2() {
        XCTAssertEqual(Day8(input: "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf").part2(), 5353)
        XCTAssertEqual(Day8(input: "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe").part2(), 8394)
        XCTAssertEqual(Day8(input: "edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc").part2(), 9781)
        XCTAssertEqual(Day8(input: "fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg").part2(), 1197)
        XCTAssertEqual(Day8(input: "fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb").part2(), 9361)
        XCTAssertEqual(Day8(input: "aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea").part2(), 4873)
        XCTAssertEqual(Day8(input: "fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb").part2(), 8418)
        XCTAssertEqual(Day8(input: "dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe").part2(), 4548)
        XCTAssertEqual(Day8(input: "bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef").part2(), 1625)
        XCTAssertEqual(Day8(input: "egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb").part2(), 8717)
        XCTAssertEqual(Day8(input: "gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce").part2(), 4315)
        XCTAssertEqual(Day8(input: day8Input).part2(), 61229)
    }

    // MARK: - Day 9
    let day9Input = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""

    func testDay9Part1() {
        XCTAssertEqual(Day9(input: day9Input).part1(), 15)
    }

    func testDay9Part2() {
        XCTAssertEqual(Day9(input: day9Input).part2(), 1134)
    }

    let day10Input = """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""

    func testDay10Remaining() {
        XCTAssertEqual(try Day10.remaining(of: "[({(<(())[]>[[{[]{<()<>>".map { $0 }), ["[", "(", "{", "(", "[", "[", "{", "{"])
        XCTAssertEqual(try Day10.remaining(of: "[(()[<>])]({[<{<<[]>>(".map { $0 }), ["(", "{", "[", "<", "{", "("])
        XCTAssertEqual(try Day10.remaining(of: "(((({<>}<{<{<>}{[]{[]{}".map { $0 }), ["(", "(", "(", "(", "<", "{", "<", "{", "{"])
        XCTAssertEqual(try Day10.remaining(of: "{<[[]]>}<{[{[{[]{()[[[]".map { $0 }), ["<", "{", "[", "{", "[", "{", "{", "[", "["])
        XCTAssertEqual(try Day10.remaining(of: "<{([{{}}[<[[[<>{}]]]>[]]".map { $0 }), ["<", "{", "(", "["])

        illigalCharacter(in: "{([(<{}[<>[]}>{[]{[(<()>", is: "}")
        illigalCharacter(in: "[[<[([]))<([[{}[[()]]]", is: ")")
        illigalCharacter(in: "[{[{({}]{}}([{[{{{}}([]", is: "]")
        illigalCharacter(in: "<(<(<(<{}))><([]([]()", is: ")")
        illigalCharacter(in: "<{([([[(<>()){}]>(<<{{", is: ">")
    }

    func illigalCharacter(in input: String, is character: Character) {
        XCTAssertThrowsError(try Day10.remaining(of: input.map { $0 })) { error in
            guard case let Day10.Error.illigalCharacter(char) = error else {
                XCTFail(AoCTests.expectedIlligalCharacter)
                return
            }
            XCTAssertEqual(char, character)
        }
    }

    func testDay10Part1() {
        XCTAssertEqual(Day10(input: day10Input).part1(), 26397)
    }

    func testDay10Part2() {
        XCTAssertEqual(Day10(input: day10Input).part2(), 288957)
    }

    let day11Input = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""

    func testDay11Part1() {
        XCTAssertEqual(Day11(input: day11Input).part1(), 1656)
    }

    func testDay11Part2() {
        XCTAssertEqual(Day11(input: day11Input).part2(), 195)
    }

    let day12Input1 = """
start-A
start-b
A-c
A-b
b-d
A-end
b-end
"""

    let day12Input2 = """
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
"""

    let day12Input3 = """
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""

    func testDay12Part1() {
        XCTAssertEqual(Day12(input: day12Input1).part1(), 10)
        XCTAssertEqual(Day12(input: day12Input2).part1(), 19)
        XCTAssertEqual(Day12(input: day12Input3).part1(), 226)
    }

    func testDay12Part2() {
        XCTAssertEqual(Day12(input: day12Input1).part2(), 36)
        XCTAssertEqual(Day12(input: day12Input2).part2(), 103)
        // This passes but is slow
        //XCTAssertEqual(Day12(input: day12Input3).part2(), 3509)
    }

    let day13Input = """
6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5
"""

    func testDay13Part1() {
        XCTAssertEqual(Day13(input: day13Input).part1(), 17)
    }

    func testDay13Part2() {
        XCTAssertEqual(Day13(input: day13Input).part2(), 16)
    }

    let day14Input = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

    func testDay14Part1() {
        XCTAssertEqual(Day14(input: day14Input).part1(), 1588)
    }

    func testDay14Part2() {
        XCTAssertEqual(Day14(input: day14Input).part2(), 2188189693529)
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
        XCTAssertEqual(Day16(input: "D2FE28").part1(), 6)
        XCTAssertEqual(Day16(input: "8A004A801A8002F478").part1(), 16)
        XCTAssertEqual(Day16(input: "38006F45291200").part1(), 9)
        XCTAssertEqual(Day16(input: "620080001611562C8802118E34").part1(), 12)
        XCTAssertEqual(Day16(input: "C0015000016115A2E0802F182340").part1(), 23)
        XCTAssertEqual(Day16(input: "A0016C880162017C3686B18A3D4780").part1(), 31)
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
