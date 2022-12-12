//
//  main.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/10/22.
//

import Foundation

// Belman-Ford algorithm
var bellmanFord = Graph<String>()

// Creating vertices with data
let A = bellmanFord.createVertex(with: "A")
let B = bellmanFord.createVertex(with: "B")
let C = bellmanFord.createVertex(with: "C")
let D = bellmanFord.createVertex(with: "D")
let E = bellmanFord.createVertex(with: "E")
let F = bellmanFord.createVertex(with: "F")

// Adding directed edges
bellmanFord.addEdge(from: A, to: B, with: 5, isDirected: true) // A -> B
bellmanFord.addEdge(from: A, to: C, with: -2, isDirected: true) // A -> C

bellmanFord.addEdge(from: B, to: D, with: 1, isDirected: true) // B -> D

bellmanFord.addEdge(from: C, to: B, with: 2, isDirected: true) // C -> B
bellmanFord.addEdge(from: C, to: E, with: 3, isDirected: true) // C -> E

bellmanFord.addEdge(from: D, to: C, with: 2, isDirected: true) // D -> C
bellmanFord.addEdge(from: D, to: E, with: 7, isDirected: true) // D -> E
bellmanFord.addEdge(from: D, to: F, with: 3, isDirected: true) // D -> F

bellmanFord.addEdge(from: E, to: F, with: 10, isDirected: true) // E -> F

print(bellmanFord.findShortestPath(from: A, using: .bellmanFord))

// Regular Graph
var regular = Graph<String>()

// Creating vertices with data
let G = regular.createVertex(with: "G")
let H = regular.createVertex(with: "H")
let I = regular.createVertex(with: "I")
let J = regular.createVertex(with: "J")

regular.addEdge(from: G, to: H)
regular.addEdge(from: G, to: I)

regular.addEdge(from: J, to: I)
regular.addEdge(from: J, to: H)

print(regular.isRegular)


// Wheel Graph
var wheel = Graph<String>()

// Creating vertices with data
let Z = wheel.createVertex(with: "Z")
let Y = wheel.createVertex(with: "Y")
let X = wheel.createVertex(with: "X")
let W = wheel.createVertex(with: "W")
let V = wheel.createVertex(with: "V")

wheel.addEdge(from: V, to: W)
wheel.addEdge(from: V, to: X)

wheel.addEdge(from: X, to: Y)

wheel.addEdge(from: Y, to: W)

wheel.addEdge(from: Z, to: V)
wheel.addEdge(from: Z, to: W)
wheel.addEdge(from: Z, to: X)
wheel.addEdge(from: Z, to: Y)

print(wheel.isWheel)
