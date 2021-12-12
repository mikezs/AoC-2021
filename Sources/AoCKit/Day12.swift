import Foundation

public final class Day12: Day {
    class Node {
        let name: String
        var connections = [Node]()

        init(name: String) {
            self.name = name
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

    func subRoutes(for node: Node, prefix: [Node], canVisitOneSmallTwice: Bool = false) -> [[Node]] {
        if node.name == "end" {
            return [[node]]
        }

        var routes = [[Node]]()

        for connected in node.connections where connected.name != "start" {
            if connected.name.lowercased() == connected.name {
                if !canVisitOneSmallTwice, prefix.contains(where: { $0.name == connected.name }) {
                    continue
                } else if canVisitOneSmallTwice {
                    if Dictionary(grouping: prefix, by: { $0.name }).filter({ $1.count > 1 }).keys.count > 1 {
                        continue
                    }
                }
            }

            subRoutes(for: connected, prefix: prefix + [node], canVisitOneSmallTwice: canVisitOneSmallTwice)
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
        subRoutes(for: input["start"]!, prefix: [], canVisitOneSmallTwice: true)
            .count
    }
}
