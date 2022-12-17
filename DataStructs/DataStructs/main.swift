//
//  main.swift
//  DataStructs
//
//  Created by Pedro Sousa on 12/10/22.
//

import Foundation

// Eulerian
var eulerianMatrix: [[Int]] = [
    [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
    [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1],
    [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1]
]

let eulerianResult = Graph<Int>.checkIfIsEulerianian(incidenceMatrix: eulerianMatrix)
print(eulerianResult.isEulerian)

// Non-Eulerian
var nonEulerianMatrix: [[Int]] = [
    [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1],
    [0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1]
]

let nonEulerianResult = Graph<Int>.checkIfIsEulerianian(incidenceMatrix: nonEulerianMatrix)
print(nonEulerianResult.isEulerian)


// Hamiltonian
var hamiltonianIncidenceMatrix = [
    [1, 1, 1, 0, 0, 0, 0],
    [1, 0, 0, 1, 1, 0, 0],
    [0, 0, 0, 1, 0, 1, 0],
    [0, 1, 0, 0, 0, 1, 1],
    [0, 0, 1, 0, 1, 0, 1]
]

let hamiltonianResult = Graph<Int>.checkIfIsHamiltonian(incidenceMatrix: hamiltonianIncidenceMatrix)
print(hamiltonianResult.isHamiltonian)

// Non-Hamiltonian
var nonHamiltonianIncidenceMatrix = [
    [1, 1, 1, 1, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1, 1],
    [0, 0, 1, 0, 0, 1, 0],
    [0, 0, 0, 1, 0, 0, 1]
]

let nonHamiltonianResult = Graph<Int>.checkIfIsHamiltonian(incidenceMatrix: nonHamiltonianIncidenceMatrix)
print(nonHamiltonianResult.isHamiltonian)
