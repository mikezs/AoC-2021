import Foundation

public final class Day12: Day {
    class Node: Equatable {
        let name: String
        var connections = [Node]()

        init(name: String) {
            self.name = name
        }

        static func == (lhs: Day12.Node, rhs: Day12.Node) -> Bool {
            lhs.name == rhs.name
        }
    }

    let input: [String: Node]

    public init(input: String) {
        var nodes = [String: Node]()

        input
            .trimmedLines
            .map { $0.components(separatedBy: "-") }
            .forEach {
                let node1Name = $0[0]
                let node2Name = $0[1]

                if !nodes.keys.contains(node1Name) {
                    nodes[node1Name] = Node(name: node1Name)
                }

                if !nodes.keys.contains(node2Name) {
                    nodes[node2Name] = Node(name: node2Name)
                }

                let node1 = nodes[node1Name]!
                let node2 = nodes[node2Name]!

                node1.connections.append(node2)
                node2.connections.append(node1)
            }

        self.input = nodes
    }

    func subRoutes(for node: Node, prefix: [Node], haveVisitedSmallTwice: Bool = true) -> [[Node]] {
        guard node.name != "end" else { return [[]] }

        var routes = [[Node]]()

        for connected in node.connections where connected.name != "start" {
            var doubleVisit = haveVisitedSmallTwice

            if connected.name.isLowercase, prefix.contains(connected) {
                if haveVisitedSmallTwice {
                    continue
                } else {
                    doubleVisit = true
                }
            }

            subRoutes(for: connected, prefix: prefix + [node], haveVisitedSmallTwice: doubleVisit)
                .forEach {
                    routes += [[connected] + $0]
                }
        }

        return routes
    }

    public func part1() -> Int {
        subRoutes(for: input["start"]!, prefix: []).count
    }

    public func part2() -> Int {
        subRoutes(for: input["start"]!, prefix: [], haveVisitedSmallTwice: false).count
    }
}
