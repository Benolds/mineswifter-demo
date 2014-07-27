//
//  Square.swift
//  Mineswifter
//
//  Created by Benjamin Reynolds on 7/26/14.
//  Copyright (c) 2014 MakeGamesWithUs. All rights reserved.
//

import Foundation

class Square : NSObject {
    
    var row:Int
    var col:Int
    // give these default values that we will re-assign later with each new game
    var numNeighboringMines:Int = 0
    var isMineLocation:Bool = false
    var isRevealed:Bool = false
    
    init(row:Int, col:Int) {
        //store the row and column of the square in the grid
        self.row = row
        self.col = col
    }
} 