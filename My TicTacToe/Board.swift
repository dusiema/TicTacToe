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
            didWin()
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
        print(turn)
        return turn
    }
    
    func didWin() {
        winVerticalHorizontal()
        winDiagonalPositive()
        winDiagonalNegative()
    }
    
    func winDiagonalPositive() {
        var array: [Field] = []
        for i in 0..<board.count {
            let place = board[i][i]
            array.append(place)
        }
        
        checkIfWinArray(array: array)
    }
    
    func winDiagonalNegative() {
        var array: [Field] = []
        var count = 0
        for i in stride(from: board.count-1, through: 0, by: -1) {
            let place = board[count][i]
            count += 1
            array.append(place)
        }
        checkIfWinArray(array: array)
    }
    
    func winVerticalHorizontal() {
        for y in 0..<board.count {
            var array: [Field] = []
            for x in 0..<board.count {
                array.append(board[x][y])
            }
            checkIfWinArray(array: array)
            checkIfWinArray(array: board[y])
        }
    }
    
    func checkIfWinArray(array: [Field]) {
        if !array.isEmpty {
            if !array.contains(.empty) {
                if !array.contains(.cross) {
                    print("Circle Wins!")
                } else if !array.contains(.circle) {
                    print("Cross Wins!")
                }
            }
        }
    }
    
    enum Field {
        case cross
        case circle
        case empty
    }
}
