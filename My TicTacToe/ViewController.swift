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
    
//    let boardView = BoardView()
    let board = Board()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBoard()
    }
    
    func setUpBoard() {
        let width = view.bounds.width - 10
        let frame = CGRect(x: 0, y: 0, width: width, height: width)
        let boardView = BoardView(frame: frame)
        boardView.center = view.center
        view.addSubview(boardView)
        boardView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedPosition(x: Int, y: Int) {
        board.didTap(xPosition: x, yPosition: y)
        turnLabel.text = board.turn == .circle ? "❌" : "⭕"

    }
    
}

