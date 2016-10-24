//
//  BoardView.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

protocol BoardViewDelegate {
    func tappedPosition(x: Int, y: Int)
}

class BoardView: UIView {
    
    let verticalCount: Int = 3
    let horizontalCount: Int = 3
    
    var delegate: BoardViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSquares(verticalCount: verticalCount, horizontalCount: horizontalCount)
    }
    
    func createSquares(verticalCount yCount: Int, horizontalCount xCount: Int) {
        for y in 0..<yCount {
            let height = self.bounds.height/CGFloat(yCount)
            let yPosition = CGFloat(y) * height
            
            for x in 0..<xCount {
                let width = self.bounds.width/CGFloat(xCount)
                let xPosition = CGFloat(x) * width
                
                //SquareView Setup
                let frame = CGRect(x: xPosition, y: yPosition, width: width, height: width)
                let squareView = FieldView(frame: frame)
                squareView.layer.borderWidth = 1
                self.addSubview(squareView)
                
                //Save the Position for the view
                squareView.xPosition = x
                squareView.yPosition = y
                
                //UITapGestureRecognizer Setup
                let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
                squareView.addGestureRecognizer(tap)
            }
        }
    }
    
    func didTap(tap: UITapGestureRecognizer) {
        if let fieldView = tap.view as? FieldView {
            let xPosition = fieldView.xPosition!
            let yPosition = fieldView.yPosition!
            print("tapped field at: \(xPosition), \(yPosition)")
            delegate?.tappedPosition(x: xPosition, y: yPosition)
        }
    }
}
