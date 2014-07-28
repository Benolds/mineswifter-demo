//
//  Board.swift
//  Mineswifter
//
//  Created by Benjamin Reynolds on 7/27/14.
//  Copyright (c) 2014 MakeGamesWithUs. All rights reserved.
//

import Foundation

class Board {
    
    let size:Int
    var squares:[[Square]] = [] // a 2d array of square cells, indexed by [row][column]
    
    init(size:Int) {
        self.size = size
        
        for row in 0 ..< size {
            var squareRow:[Square] = []
            for col in 0 ..< size {
                let square = Square(row: row, col: col)
                squareRow.append(square)
            }
            squares.append(squareRow)
        }
    }
    
    func resetBoard() {
        // assign mines to squares
        for row in 0 ..< size {
            for col in 0 ..< size {
                squares[row][col].isRevealed = false
                self.calculateIsMineLocationForSquare(squares[row][col])
            }
        }
        
        // count number of neighboring squares
        for row in 0 ..< size {
            for col in 0 ..< size {
                self.calculateNumNeighborMinesForSquare(squares[row][col])
            }
        }
    }
    
    func calculateIsMineLocationForSquare(square: Square) {
        square.isMineLocation = ((arc4random()%10) == 0) // 1-in-10 chance that each location contains a mine
    }
    
    func calculateNumNeighborMinesForSquare(square : Square) {
        // first get a list of adjacent squares
        let neighbors = getNeighboringSquares(square)
        var numNeighboringMines = 0
        
        // for each neighbor with a mine, add 1 to this square's count
        for neighborSquare in neighbors {
            if neighborSquare.isMineLocation {
                numNeighboringMines++
            }
        }
        square.numNeighboringMines = numNeighboringMines
    }
    
    func getNeighboringSquares(square : Square) -> [Square] {
        var neighbors:[Square] = []

        // an array of tuples containing the relative position of each neighbor to the square
        let adjacentOffsets =
            [(-1,-1),(0,-1),(1,-1),
            (-1,0),(1,0),
            (-1,1),(0,1),(1,1)]
        
        for (rowOffset,colOffset) in adjacentOffsets {
            // getTileAtLocation might return a Square, or it might return nil, so use the optional datatype "?"
            let optionalNeighbor:Square? = getTileAtLocation(square.row+rowOffset, col: square.col+colOffset)
            // only evaluates true if the optional tile isn't nil
            if let neighbor = optionalNeighbor {
                neighbors.append(neighbor)
            }
        }
        return neighbors
    }
    
    func getTileAtLocation(row : Int, col : Int) -> Square? {
        if row >= 0 && row < self.size && col >= 0 && col < self.size {
            return squares[row][col]
        } else {
            return nil
        }
    }
    
    
}