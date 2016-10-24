//
//  Board.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class Board: BoardViewDelegate {
    
    init() {
        let boardView = BoardView()
        boardView.delegate = self
    }
    
    func tappedPosition(x: Int, y: Int) {
        print("Hello")
    }
}
