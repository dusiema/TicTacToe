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
    
    //Create the Board Model:
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
    
    //User tapped on a given area of the Board:
    func didTap(xPosition x: Int, yPosition y: Int) -> gameState {
        if !spotIsTaken(xPosition: x, yPosition: y) && !boardIsFull() && !didWin() {
            board[y][x] = nextPlayer()
            if didWin() {
                return .win
            } else if boardIsFull(){
                return .full
            } else {
                return .lost
            }
            
        } else {
            if spotIsTaken(xPosition: x, yPosition: y) {
                return .taken
            } else if boardIsFull() {
                return .full
            } else if didWin() {
                return .win
            } else {
                return .win
            }
        }
    }
    
    //Returns true if the Board is full:
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
    
    //Returns true if the spot that was tapped is taken:
    func spotIsTaken(xPosition x: Int, yPosition y: Int) -> Bool {
        if board[y][x] != Field.empty {
            return true
        } else {
            return false
        }
    }
    
    //Returns the next turn:
    func nextPlayer() -> Field {
        turn = turn == Field.cross ? Field.circle : Field.cross
        return turn
    }
    
    //Returns true if a player won:
    func didWin() -> Bool {
        if winVertical() || winDiagonalPositive() || winDiagonalNegative() || winHorizontal() {
            return true
        } else {
            return false
        }
    }
    
    //Returns true if a player won in a Positive Slope direction:
    func winDiagonalPositive() -> Bool {
        var array: [Field] = []
        for i in 0..<board.count {
            let place = board[i][i]
            array.append(place)
        }
        return checkIfWinArray(array: array)
    }
    
    //Returns true if a player won in a Negative Slope direction:
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
    
    //Returns true if a player won in a horizontal direction:
    func winHorizontal() -> Bool {
        for y in 0..<board.count {
            if checkIfWinArray(array: board[y]) {
                return true
            }
        }
        return false
    }
    
    //Returns true if a player won in a vertical direction:
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
    
    //Returns true if there is a winning hand on the board:
    func checkIfWinArray(array: [Field]) -> Bool {
        if !array.isEmpty {
            if !array.contains(.empty) {
                if !array.contains(.cross) {
                    return true
                } else if !array.contains(.circle) {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
    
    //Clear the Board Model:
    func clear() {
        createBoard(xCount: 3, yCount: 3)
    }
    
    enum Field {
        case cross
        case circle
        case empty
    }
}

enum gameState {
    case win
    case lost
    case full
    case taken
}
