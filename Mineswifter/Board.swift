//
//  Board.swift
//  Mineswifter
//
//  Created by Benjamin Reynolds on 7/27/14.
//  Copyright (c) 2014 MakeGamesWithUs. All rights reserved.
//

import Foundation

class Board: NSObject {
    
    let size:Int
    var squares:[[Square]] = [] // a 2d array of square cells, indexed by [row][column]
    
    init(size:Int) {
        self.size = size
        super.init()
        
        for row in 0 ..< size {
            var squareRow:[Square] = []
            for col in 0 ..< size {
                let square = Square(row: row, col: col)
                squareRow.append(square)
            }
            squares.append(squareRow)
        }
        
    }
}