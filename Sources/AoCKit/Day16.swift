import Foundation

indirect enum Packet {
    case op(Int, [Packet])
    case literal(Int, Int)

    var total: Int {
        switch self {
        case let .op(version, packets):
            return version + packets.reduce(0) { $0 + $1.total }
        case let .literal(version, _):
            return version
        }
    }
}

public extension String {
    subscript(value: CountableClosedRange<Int>) -> Substring {
        self[index(startIndex, offsetBy: value.lowerBound)...index(startIndex, offsetBy: value.upperBound)]
    }
    subscript(value: CountableRange<Int>) -> Substring {
        self[index(startIndex, offsetBy: value.lowerBound)..<index(startIndex, offsetBy: value.upperBound)]
    }
}

public final class Day16: Day {
    let input: String

    public init(input: String) {
        self.input = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .reduce("") {
                $0 + String(format: "%04d", Int(String(Int(String($1), radix: 16)!, radix: 2))!)
            }
    }

    func packet(at position: Int) -> (packet: Packet, offset: Int)? {
        guard input.count - 6 > 0 else { return nil }

        let version = String(input[position..<position+3]).binaryAsInt
        let packetID = String(input[position+3..<position+6]).binaryAsInt

        guard let version = version else { fatalError() }

        if packetID == 4 {
            print("processing lit")
            var literalOffset = position+6

            var currentBinary = ""

            while true {
                let current = input[literalOffset..<literalOffset+5]
                currentBinary += String(current)[1..<5]
                literalOffset += 5

                if current.starts(with: "0") { break }
            }

            return (.literal(version, currentBinary.binaryAsInt!), literalOffset)
        } else {
            print("processing op")
            var lengthOffset = position+6
            let lengthType = input[lengthOffset]
            lengthOffset += 1
            let length: Int

            if lengthType == "0" {
                length = String(input[lengthOffset..<lengthOffset+15]).binaryAsInt!
                lengthOffset += 15
            } else {
                length = String(input[lengthOffset..<lengthOffset+11]).binaryAsInt!
                lengthOffset += 11
            }

            var subPackets = [Packet]()
            var currentPacketOffset = lengthOffset
            let offset = lengthOffset+length

            while currentPacketOffset < offset {
                let packet = packet(at: currentPacketOffset)
                currentPacketOffset = packet!.offset
                subPackets.append(packet!.packet)
            }

            return (.op(version, subPackets), offset)
        }
    }

    public func part1() -> Int {
        packet(at: 0)!.packet.total
    }

    public func part2() -> Int {
        return 0
    }
}
