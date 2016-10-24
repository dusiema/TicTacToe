//
//  ViewController.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boardView = BoardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBoard()
    }
    
    func setUpBoard() {
        let width = view.bounds.width - 10
        let frame = CGRect(x: 0, y: 0, width: width, height: width)
        boardView = BoardView(frame: frame)
        boardView.center = view.center
        boardView.backgroundColor = UIColor.clear
        boardView.layer.borderWidth = 2
        boardView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(boardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

