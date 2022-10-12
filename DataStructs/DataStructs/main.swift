//
//  main.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/10/22.
//

import Foundation

var graph = Graph<Int>()

// Creating vertices with data
print("\n\nCreating vertices with data\n\n")
let v1 = graph.createVertex(with: 2)
let v2 = graph.createVertex(with: 3)
let v3 = graph.createVertex(with: 5)
let v4 = graph.createVertex(with: 7)
let v5 = graph.createVertex(with: 8)
let v6 = graph.createVertex(with: 9)
let v7 = graph.createVertex(with: 10)
let v8 = graph.createVertex(with: 11)

// Adding directed edges
print("\n\nAdding directed edges\n\n")
graph.addEdge(from: v4, to: v5, isDirected: true) // 7 -> 8
graph.addEdge(from: v4, to: v8, isDirected: true) // 7 -> 11

graph.addEdge(from: v8, to: v1, isDirected: true) // 11 -> 2
graph.addEdge(from: v8, to: v6, isDirected: true) // 11 -> 9
graph.addEdge(from: v8, to: v7, isDirected: true) // 11 -> 10

graph.addEdge(from: v3, to: v8, isDirected: true) // 5 -> 11

graph.addEdge(from: v2, to: v5, isDirected: true) // 3 -> 8
graph.addEdge(from: v2, to: v7, isDirected: true) // 3 -> 10

graph.addEdge(from: v5, to: v6, isDirected: true) // 8 -> 9

// Printing Adjacency Matrix
print("\n\nPrinting Adjacency Matrix\n\n")
print(graph)

// Counting entering and leaving edges for each vertex in graph
print("\n\nCounting entering and leaving edges for each vertex in graph\n\n")
for vertex in graph.vertices {
    print(vertex, graph.count(vertex))
}

// Create Graph with Incidence Matrix
print("\n\nCreate Graph with Incidence Matrix\n\n")
let incidenceMatrix = [
    [1, 1, 0, 0],
    [1, 0, 1, 0],
    [0, 1, 1, 1],
    [0, 0, 0, 1]
]

if let incidenceGraph = Graph<Int>.createGraph(withIncidenceMatrix: incidenceMatrix) {
    print(incidenceGraph)
}

// Create Topology Graph
print("\n\nCreate Topology Graph\n\n")

var topologyGraph = Graph<String>()

let a = topologyGraph.createVertex(with: "A")
let b = topologyGraph.createVertex(with: "B")
let c = topologyGraph.createVertex(with: "C")
let d = topologyGraph.createVertex(with: "D")
let e = topologyGraph.createVertex(with: "E")
let f = topologyGraph.createVertex(with: "F")
let g = topologyGraph.createVertex(with: "G")
let h = topologyGraph.createVertex(with: "H")
let i = topologyGraph.createVertex(with: "I")
let j = topologyGraph.createVertex(with: "J")

topologyGraph.addEdge(from: a, to: c, isDirected: true)
topologyGraph.addEdge(from: a, to: b, isDirected: true)

topologyGraph.addEdge(from: b, to: c, isDirected: true)
topologyGraph.addEdge(from: b, to: f, isDirected: true)
topologyGraph.addEdge(from: b, to: g, isDirected: true)

topologyGraph.addEdge(from: c, to: d, isDirected: true)

topologyGraph.addEdge(from: d, to: e, isDirected: true)

topologyGraph.addEdge(from: f, to: d, isDirected: true)

topologyGraph.addEdge(from: g, to: h, isDirected: true)
topologyGraph.addEdge(from: g, to: j, isDirected: true)

topologyGraph.addEdge(from: h, to: d, isDirected: true)

topologyGraph.addEdge(from: i, to: e, isDirected: true)

topologyGraph.addEdge(from: j, to: i, isDirected: true)

print(topologyGraph.generateTopology())
