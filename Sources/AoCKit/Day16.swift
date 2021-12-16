import Foundation

indirect enum Packet {
    enum Operator: Int {
        case sum = 0
        case product = 1
        case min = 2
        case max = 3
        case greater = 5
        case less = 6
        case equal = 7
    }

    case op(Int, Operator, [Packet])
    case literal(Int, Int)

    var total: Int {
        switch self {
        case let .op(version, _, packets):
            return version + packets.reduce(0) { $0 + $1.total }
        case let .literal(version, _):
            return version
        }
    }

    var value: Int {
        switch self {
        case let .op(_, op, packets):
            switch op {
            case .sum: return packets.reduce(0) { $0 + $1.value }
            case .product: return packets.reduce(1) { $0 * $1.value }
            case .min: return packets.map { $0.value }.min()!
            case .max: return packets.map { $0.value }.max()!
            case .greater: return packets[0].value > packets[1].value ? 1 : 0
            case .less: return packets[0].value < packets[1].value ? 1 : 0
            case .equal: return packets[0].value == packets[1].value ? 1 : 0
            }
        case let .literal(_, value):
            return value
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

        let version = String(input[position..<position+3]).binaryAsInt!
        let packetID = String(input[position+3..<position+6]).binaryAsInt!

        if packetID == 4 {
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
            var lengthOffset = position+6
            let lengthType = input[lengthOffset]
            lengthOffset += 1
            var subPackets = [Packet]()
            let offset: Int

            if lengthType == "0" {
                let length = String(input[lengthOffset..<lengthOffset+15]).binaryAsInt!
                lengthOffset += 15

                var currentPacketOffset = lengthOffset
                offset = lengthOffset+length

                while currentPacketOffset < offset {
                    let packet = packet(at: currentPacketOffset)
                    currentPacketOffset = packet!.offset
                    subPackets.append(packet!.packet)
                }
            } else {
                let numberOfSubPackets = String(input[lengthOffset..<lengthOffset+11]).binaryAsInt!
                lengthOffset += 11

                var currentPacketOffset = lengthOffset

                for _ in 0..<numberOfSubPackets {
                    let packet = packet(at: currentPacketOffset)
                    currentPacketOffset = packet!.offset
                    subPackets.append(packet!.packet)
                }

                offset = currentPacketOffset
            }

            return (.op(version, Packet.Operator(rawValue: packetID)!, subPackets), offset)
        }
    }

    public func part1() -> Int {
        packet(at: 0)!.packet.total
    }

    public func part2() -> Int {
        packet(at: 0)!.packet.value
    }
}
