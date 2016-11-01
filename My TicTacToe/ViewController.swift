//
//  ViewController.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardViewDelegate {
    
    @IBOutlet weak var turnLabel: UILabel!
    
//    var boardView = BoardView()
    let board = Board()
    var boardView: BoardView? = nil
    var gameOver: GameOverView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBoard()
        gameOverView()
    }
    
    func setUpBoard() {
        let width = view.bounds.width - 10
        let frame = CGRect(x: 0, y: 0, width: width, height: width)
        self.boardView = BoardView(frame: frame)
        self.boardView?.center = view.center
        view.addSubview(self.boardView!)
        self.boardView?.delegate = self
    }
    
    func gameOverView() {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        self.gameOver = GameOverView(frame: frame)
        gameOver?.isHidden = true
        view.addSubview(self.gameOver!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedPosition(x: Int, y: Int) {
        if board.didTap(xPosition: x, yPosition: y) {
            turnLabel.text = board.turn == .circle ? "❌" : "⭕"
            let turn = board.turn == .circle ? "⭕" : "❌"
            boardView?.updateFieldAtPosition(xPosition: x, yPostion: y, turn: turn)
        } else {
            gameOver?.isHidden = false
            boardView?.clear()
            board.clear()
        }
    }
}

