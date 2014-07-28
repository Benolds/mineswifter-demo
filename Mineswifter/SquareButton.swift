//
//  SquareButton.swift
//  Mineswifter
//
//  Created by Benjamin Reynolds on 7/27/14.
//  Copyright (c) 2014 MakeGamesWithUs. All rights reserved.
//

import UIKit

class SquareButton : UIButton {
    let squareSize:CGFloat
    var square:Square
    
    init(squareModel:Square, squareSize:CGFloat) {
        self.square = squareModel
        self.squareSize = squareSize
        
        let x = CGFloat(self.square.col) * squareSize
        let y = CGFloat(self.square.row) * squareSize
        let squareFrame = CGRectMake(x, y, squareSize, squareSize)
        
        super.init(frame: squareFrame)        
    }
    
    func getLabelText() -> String {
        // check the isMineLocation and numNeighboringMines properties to determine the text to display
        if !self.square.isMineLocation {
            if self.square.numNeighboringMines == 0 {
                // case 1: there's no mine and no neighboring mines
                return ""
            }else {
                // case 2: there's no mine but there are neighboring mines
                return "\(self.square.numNeighboringMines)"
            }
        }
        // case 3: there's a mine
        return "M"
    }
    
}