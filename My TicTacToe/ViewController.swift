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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBoard()
    }
    
    func setUpBoard() {
        let width = view.bounds.width - 10
        let frame = CGRect(x: 0, y: 0, width: width, height: width)
        self.boardView = BoardView(frame: frame)
        self.boardView?.center = view.center
        view.addSubview(self.boardView!)
        self.boardView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedPosition(x: Int, y: Int) {
        if board.didTap(xPosition: x, yPosition: y) && board.didWin() {
            turnLabel.text = board.turn == .circle ? "❌" : "⭕"
            let turn = board.turn == .circle ? "⭕" : "❌"
            boardView?.updateFieldAtPosition(xPosition: x, yPostion: y, turn: turn)
        }
    }
}

