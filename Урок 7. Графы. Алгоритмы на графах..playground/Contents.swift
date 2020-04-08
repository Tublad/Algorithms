import Foundation

//Выполнил работу Евгений Шварцкопф

// Построение Графа

class Node: Equatable {
    
    var label: String
    var neighbors: Array<Edge>
    var color: String?
    var predecessor: Node?
    var discoveredTimestamp: Int?
    var finishedTimestamp: Int?
    var distance: Int?
    
    init(_ label: String) {
        self.label = label
        self.neighbors = Array<Edge>()
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.label == rhs.label
    }
    
}

class Edge {
    
    var neighbor: Node
    var weight: Int?
    
    init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

class Graph {
    
    var nodes: Array<Node>
    
    init() {
        self.nodes = Array<Node>()
    }
    
    func addNode(_ label: String) {
        let newNode = Node(label)
        nodes.append(newNode)
    }
    
    func addEdge(from source: Node, to destination: Node) {
        let newEdge = Edge(destination)
        source.neighbors.append(newEdge)
        destination.neighbors.append(Edge(source))
    }
}


struct Queue<T> {
    
    var items: [T] = []
    
    init(){}
    
    mutating func enqueue(element: T) {
        items.append(element)
    }
    
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.remove(at: 0)
        }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

//3. Написать функцию обхода графа в ширину.

func breadthFirstSearch(graph: Graph, source: Node) {
    var visitedNodes = Queue<Node>()
    
    for node in graph.nodes {
        node.color = "Purple"
        node.distance = nil
        node.predecessor = nil
    }
    
    source.color = "Green"
    source.distance = 0
    source.predecessor = nil
    
    visitedNodes.enqueue(element: source)
    
    while !visitedNodes.isEmpty {
        
        if let currentNode = visitedNodes.dequeue() {
            
            for edge in currentNode.neighbors {
                
                if edge.neighbor.color == "Purple" {
                    edge.neighbor.color = "Green"
                    edge.neighbor.distance = currentNode.distance! + 1
                    edge.neighbor.predecessor = currentNode
                    visitedNodes.enqueue(element: edge.neighbor)
                }
            }
            currentNode.color = "Black"
        }
    }
}

//2. Написать рекурсивную функцию обхода графа в глубину.

func depthFirstSearch(graph: Graph) {
    
    for node in graph.nodes {
        node.color = "Purple"
        node.predecessor = nil
    }
    
    var timestamp = 0
    
    for node in graph.nodes {
        if node.color == "Purple" {
            dfsVisit(node: node, timestamp: &timestamp)
        }
    }
}

func dfsVisit(node: Node, timestamp: inout Int) {
    
    timestamp = timestamp + 1
    node.discoveredTimestamp = timestamp
    node.color = "Green"
    
    for edge in node.neighbors {
        if edge.neighbor.color == "Purple" {
            edge.neighbor.predecessor = node
            dfsVisit(node: edge.neighbor, timestamp: &timestamp)
        }
    }
    node.color = "Black"
    timestamp = timestamp + 1
    node.finishedTimestamp = timestamp
}
