//
//  Graph+ComputedProperties.swift
//  DataStructs
//
//  Created by Pedro Sousa on 16/12/22.
//

import Foundation

extension Graph {
    var isDirected: Bool {
        return self.edges.first(where: { $0.isDirected }) != nil
    }

    var isRegular: Bool {
        guard let randomVertex = self.vertices.randomElement()
        else { return true }

        return self.vertices.allSatisfy { $0.edgeList.count == randomVertex.edgeList.count }
    }

    var isWheel: Bool {
        guard self.vertices.count > 3,
              let wheelCenter = self.vertices.first(where: { $0.edgeList.count == self.vertices.count - 1 }),
              let nonWheelCenterVertex = self.vertices.first(where: { $0 != wheelCenter })
        else { return false }

        return self.vertices.allSatisfy { vertex in
            if vertex == wheelCenter {
                return true
            } else {
                return vertex.edgeList.count == nonWheelCenterVertex.edgeList.count
            }
        }
    }

    var isConnected: Bool {
        guard var currentVertex = self.vertices.randomElement()
        else {
            print("Empty graph.")
            return false
        }

        var verticesStack: [Vertex<T>] = []

        var visited: [Bool] = Array(repeating: false, count: self.vertices.count)
        visited[currentVertex.index] = true

        while visited.contains(false) {
            let nextEdge = currentVertex.edgeList.first(where: { edge in
                if edge.isDirected {
                    return !visited[edge.toVertex.index]
                } else {
                    return !visited[edge.toVertex.index] || !visited[edge.fromVertex.index]
                }
            })

            if let nextEdge = nextEdge {
                verticesStack.append(currentVertex)

                if nextEdge.isDirected {
                    currentVertex = nextEdge.toVertex
                } else if currentVertex == nextEdge.fromVertex {
                    currentVertex = nextEdge.toVertex
                } else {
                    currentVertex = nextEdge.fromVertex
                }

                visited[currentVertex.index] = true
            } else if verticesStack.isEmpty {
                break
            } else {
                currentVertex = verticesStack.removeLast()
            }
        }

        return !visited.contains(false)
    }

    var isEulerian: Bool {
        if self.isDirected {
            // Every vertex must not be isolated and must have the same number of entenring and leaving edges.
            for vertex in vertices {
                let degree = self.degree(of: vertex)
                if degree.entering == 0 || degree.leaving == 0 || degree.entering != degree.leaving {
                    return false
                }
            }
        } else {
            // Every vertex must not be isolated and must have a even number of edges.
            for vertex in vertices {
                if vertex.edgeList.isEmpty || vertex.edgeList.count % 2 != 0 {
                    return false
                }
            }
        }

        // Resturns true only if is a connected graph and passes the previous if-statements.
        return isConnected
    }

    var isHamiltonian: Bool {
        if self.isDirected {
            print("Not implemented to directed graphs.")
            return false
        }

        if self.vertices.count < 3 {
            print("Impossible to close a hamiltonian cycle due to number of vertices.")
            return false
        }

        // Dirac's condition (1952)
        // For every vertice v in the graph, the degree of v must be bigger or equal to the number of vertices in the graph divided by 2
        let isDirac = self.vertices.allSatisfy({ Double($0.edgeList.count) >= Double(self.vertices.count) / 2 })

        // Ore's condition (1960)
        // For every non-djacent pair of vertices in the graph, the sum of the degree of the pais must be bigger or equal to the number of vertices
        let isOre = self.vertices.allSatisfy { vertex in
            let adjacentVertices: Set<Vertex<T>> = Set(vertex.edgeList.map { $0.toVertex })
            let nonAdjacentVertices = Set(self.vertices).symmetricDifference(adjacentVertices)

            return nonAdjacentVertices.allSatisfy { $0.edgeList.count + vertex.edgeList.count >= self.vertices.count }
        }

        // Returns true only if is a connected graph and if the graph satifies the Dirac's condition or Ore's condition or is a regular graph.
        return self.isConnected && (isDirac || isOre || self.isRegular)
    }
}
