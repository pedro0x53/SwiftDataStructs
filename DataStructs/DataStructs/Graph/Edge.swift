//
//  Edge.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/10/22.
//

import Foundation

class Edge<T>: Equatable where T: Equatable, T: Hashable {
    var fromVertex: Vertex<T>
    var toVertex: Vertex<T>

    var weight: Double

    var isDirected: Bool

    init(from fromVertex: Vertex<T>, to toVertex: Vertex<T>, with weight: Double, isDeirected: Bool = false) {
        self.fromVertex = fromVertex
        self.toVertex = toVertex
        self.weight = weight
        self.isDirected = isDeirected

        fromVertex.edgeList.append(self)
    }
}

extension Edge {
    static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return  lhs.fromVertex == rhs.fromVertex &&
                lhs.toVertex == rhs.toVertex &&
                lhs.weight == rhs.weight
    }
}
