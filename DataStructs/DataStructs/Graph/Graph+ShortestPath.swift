//
//  Graph+ShortestPath.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/12/22.
//

import Foundation

extension Graph {
    enum ShortestPathApproach {
        case bellmanFord
        case dijkstra
    }

    func findShortestPath(from source: Vertex<T>, using approach: ShortestPathApproach) -> [Double] {
        switch approach {
        case .bellmanFord:
            return bellmanFord(source)
        case .dijkstra:
            return []
        }
    }

    private func bellmanFord(_ source: Vertex<T>) -> [Double] {
        guard source.index < self.vertices.count
        else { return [] }

        var distances = Array<Double>(repeating: Double.infinity, count: self.vertices.count)
        distances[source.index] = 0

        for _ in 0..<self.vertices.count {
            for edge in self.edges {
                if  distances[edge.fromVertex.index] != Double.infinity &&
                    distances[edge.fromVertex.index] + edge.weight < distances[edge.toVertex.index] {
                    distances[edge.toVertex.index] = distances[edge.fromVertex.index] + edge.weight
                }
            }
        }

        for edge in self.edges {
            if  distances[edge.fromVertex.index] != Double.infinity &&
                distances[edge.fromVertex.index] + edge.weight < distances[edge.toVertex.index] {
                print("Graph contains a negative weight cycle")
                return []
            }
        }

        return distances
    }
}
