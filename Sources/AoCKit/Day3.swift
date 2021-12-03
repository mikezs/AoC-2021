import Foundation

public final class Day3: Day {
    let input: [[Character]]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Array($0) }
    }

    public func part1() throws -> Int {
        var gammaBinary = ""
        var epsilonBinary = ""

        for i in 0 ..< input[0].count {
            var one = 0
            var zero = 0

            input.forEach {
                ($0[i] == "0") ? (zero += 1) : (one += 1)
            }

            gammaBinary += one > zero ? "1" : "0"
            epsilonBinary += one > zero ? "0" : "1"
        }

        guard let gamma = Int(gammaBinary, radix: 2),
              let epsilon = Int(epsilonBinary, radix: 2) else         {
            throw Error.invalidInput
        }

        return gamma * epsilon
    }

    public func part2() throws -> Int {
        // Copy input
        var oxygenResult = input
        var co2Result = input

        var index = 0
        while oxygenResult.count > 1 {
            var one = 0
            var zero = 0

            let slice = verticalSlice(array: oxygenResult, at: index)
            slice.forEach {
                ($0 == "0") ? (zero += 1) : (one += 1)
            }

            let mostCommon: Character = one >= zero ? "1" : "0"

            for i in (0..<slice.count).reversed()  where slice[i] != mostCommon {
                oxygenResult.remove(at: i)
            }

            index += 1
        }

        index = 0
        while co2Result.count > 1 {
            var one = 0
            var zero = 0

            let slice = verticalSlice(array: co2Result, at: index)
            slice.forEach {
                ($0 == "0") ? (zero += 1) : (one += 1)
            }

            let mostCommon: Character = one < zero ? "1" : "0"

            for i in (0..<slice.count).reversed() where slice[i] != mostCommon {
                co2Result.remove(at: i)
            }

            index += 1
        }

        guard let oxygen = Int(String(oxygenResult[0]), radix: 2),
              let co2 = Int(String(co2Result[0]), radix: 2) else         {
            throw Error.invalidInput
        }

        return oxygen * co2
    }

    func verticalSlice<T>(array: [[T]], at index: Int) -> [T] {
        array.reduce([T](), { $0 + [$1[index]] })
    }
}
