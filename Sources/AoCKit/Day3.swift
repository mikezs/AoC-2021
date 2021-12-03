import Foundation

public final class Day3: Day {
    let input: [[Character]]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Array($0) }
    }

    public func part1() throws -> Int {
        let gamma = String(
            (0 ..< input[0].count)
            .map {
                input.verticalSlice($0).mode()[0]
            })
        let epsilon = gamma.replacing(pairs: [("0", "1"), ("1", "0")])

        return (gamma.binaryAsInt ?? 0) * (epsilon.binaryAsInt ?? 0)
    }

    public func part2() throws -> Int {
        var oxygens = input
        var co2s = input

        for index in 0 ..< input[0].count where oxygens.count > 1 {
            let modes = oxygens.verticalSlice(index).mode()

            oxygens = oxygens.filter {
                $0[index] == (modes.count > 1 ? "1" : modes[0])
            }
        }

        for index in 0 ..< input[0].count where co2s.count > 1 {
            let modes = co2s.verticalSlice(index).mode()

            co2s = co2s.filter {
                let least: Character = modes[0] == "0" ? "1": "0"
                return $0[index] == (modes.count > 1 ? "0" : least)
            }
        }

        return (String(oxygens[0]).binaryAsInt ?? 0) * (String(co2s[0]).binaryAsInt ?? 0)
    }
}
