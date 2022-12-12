//
//  main.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/10/22.
//

import Foundation

var graph = Graph<String>()

// Creating vertices with data
print("\n\nCreating vertices with data\n\n")
let A = graph.createVertex(with: "A")
let B = graph.createVertex(with: "B")
let C = graph.createVertex(with: "C")
let D = graph.createVertex(with: "D")
let E = graph.createVertex(with: "E")
let F = graph.createVertex(with: "F")

// Adding directed edges
print("\n\nAdding directed edges\n\n")
graph.addEdge(from: A, to: B, with: 5, isDirected: true) // A -> B
graph.addEdge(from: A, to: C, with: -2, isDirected: true) // A -> C

graph.addEdge(from: B, to: D, with: 1, isDirected: true) // B -> D

graph.addEdge(from: C, to: B, with: 2, isDirected: true) // C -> B
graph.addEdge(from: C, to: E, with: 3, isDirected: true) // C -> E

graph.addEdge(from: D, to: C, with: 2, isDirected: true) // D -> C
graph.addEdge(from: D, to: E, with: 7, isDirected: true) // D -> E
graph.addEdge(from: D, to: F, with: 3, isDirected: true) // D -> F

graph.addEdge(from: E, to: F, with: 10, isDirected: true) // E -> F

print(graph.findShortestPath(from: A, using: .bellmanFord))
