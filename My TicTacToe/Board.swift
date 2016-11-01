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
    
    func didTap(xPosition x: Int, yPosition y: Int) -> Bool {
        if !spotIsTaken(xPosition: x, yPosition: y) && !boardIsFull() && !didWin() {
            board[y][x] = nextPlayer()
            didWin()
            return true
        } else {
            print("Board is Full or Spot is taken")
            return false
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
    
    func didWin() -> Bool {
        if winVertical() || winDiagonalPositive() || winDiagonalNegative() || winHorizontal() {
            print("Won")
            return true
        } else {
            print("Lost")
            return false
        }
    }
    
    func winDiagonalPositive() -> Bool {
        var array: [Field] = []
        for i in 0..<board.count {
            let place = board[i][i]
            array.append(place)
        }
        
        return checkIfWinArray(array: array)
    }
    
    func winDiagonalNegative() -> Bool {
        var array: [Field] = []
        var count = 0
        for i in stride(from: board.count-1, through: 0, by: -1) {
            let place = board[count][i]
            count += 1
            array.append(place)
        }
        return checkIfWinArray(array: array)
    }
    
    func winHorizontal() -> Bool {
        for y in 0..<board.count {
            if checkIfWinArray(array: board[y]) {
                return true
            }
        }
        return false
    }
    
    func winVertical() -> Bool {
        for y in 0..<board.count {
            var array: [Field] = []
            for x in 0..<board.count {
                array.append(board[x][y])
            }
            if checkIfWinArray(array: array) {
                return true
            }
        }
        return false
    }
    
    func checkIfWinArray(array: [Field]) -> Bool {
        if !array.isEmpty {
            if !array.contains(.empty) {
                if !array.contains(.cross) {
                    print("Circle Wins!")
                    return true
                } else if !array.contains(.circle) {
                    print("Cross Wins!")
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    func clear() {
        createBoard(xCount: 3, yCount: 3)
        print("Cleared")
    }
    
    enum Field {
        case cross
        case circle
        case empty
    }
}
