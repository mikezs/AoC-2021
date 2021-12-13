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

    func subRoutes(for node: Node, prefix: [Node], canVisitOneSmallTwice: Bool = false) -> [[Node]] {
        if node.name == "end" {
            return [[]]
        }

        var routes = [[Node]]()

        for connected in node.connections where connected.name != "start" {
            if connected.name.lowercased() == connected.name {
                let willCauseDuplicate = prefix.contains(where: { $0.name == connected.name })

                if willCauseDuplicate, !canVisitOneSmallTwice {
                    continue
                }

                if canVisitOneSmallTwice {
                    let alreadyHaveDuplicate = prefix.duplicates().filter({ $0.name.lowercased() == $0.name }).count >= 1

                    if willCauseDuplicate, alreadyHaveDuplicate {
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
        let routes = subRoutes(for: input["start"]!, prefix: [], canVisitOneSmallTwice: true)
            .filter { $0.duplicates().filter { $0.name.lowercased() == $0.name }.count <= 1 }

        //routes.forEach { print($0.reduce("start", { "\($0),\($1.name)" })) }

        return routes.count
    }
}

extension Array where Element: Equatable {
    // Note: This is slow and inefficient
    func duplicates() -> [Element] {
        var duplicates = [Element]()

        for element in self where !duplicates.contains(element) {
            if filter({ $0 == element }).count > 1 {
                duplicates.append(element)
            }
        }

        return duplicates
    }
}
