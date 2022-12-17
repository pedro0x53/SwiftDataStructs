//
//  Graph+Functions.swift
//  DataStructs
//
//  Created by Pedro Sousa on 16/12/22.
//

import Foundation

extension Graph {
    static func checkIfIsEulerianian(incidenceMatrix: [[Int]]) -> (graph: Graph<Int>, isEulerian: Bool) {
        guard let graph = self.createGraph(withIncidenceMatrix: incidenceMatrix)
        else {
            fatalError("Error: unable to create graph becaouse incidence matrix is wrong.")
        }

        return (graph, graph.isEulerian)
    }

    static func checkIfIsHamiltonian(incidenceMatrix: [[Int]]) -> (graph: Graph<Int>, isHamiltonian: Bool) {
        guard let graph = self.createGraph(withIncidenceMatrix: incidenceMatrix)
        else {
            fatalError("Error: unable to create graph becaouse incidence matrix is wrong.")
        }

        return (graph, graph.isHamiltonian)
    }
}
