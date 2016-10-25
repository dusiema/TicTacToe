//
//  Board.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class Board {
    
//    var board: [[Field]] = [[.empty, .empty, .empty], [.empty, .empty, .empty], [.empty, .empty, .empty]]
    
    var board: [[Field]] = []
    var turn: Field = Field.cross
    
    init() {
        createBoard(xCount: 3, yCount: 3)
    }

    func createBoard(xCount: Int, yCount: Int) {
        var xArray: [Field] = []
        var yArray: [[Field]] = []
        
        for _ in 0..<xCount {
            xArray.append(.empty)
        }
        for _ in 0..<yCount {
            yArray.append(xArray)
        }
        board = yArray
    }
    
    func didTap(xPosition x: Int, yPosition y: Int) {
        if !spotIsTaken(xPosition: x, yPosition: y) && !boardIsFull() {
            board[y][x] = nextPlayer()
            print("\(x),\(y)")
            print(board[y][x])
        } else {
            print("Board is Full or Spot is taken")
        }
    }
    
    func boardIsFull() -> Bool {
        var count = 0
        for i in 0..<board.count {
            count = !board[i].contains(.empty) ? count+1 : count
        }
        if count == board.count {
            return true
        } else {
            return false
        }
    }
    
    func spotIsTaken(xPosition x: Int, yPosition y: Int) -> Bool {
        if board[y][x] != Field.empty {
            return true
        } else {
            return false
        }
    }
    
    func nextPlayer() -> Field {
        turn = turn == Field.cross ? Field.circle : Field.cross
        return turn
    }
    
//    func didWin() {
//        for i in 0..<board.count {
//            if board[i] == [.empty, .empty, .empty]
//        }
//    }
    
    enum Field {
        case cross
        case circle
        case empty
    }
}
