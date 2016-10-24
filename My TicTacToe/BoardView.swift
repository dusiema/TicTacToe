//
//  BoardView.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class BoardView: UIView {
    
    
    let verticalCount: CGFloat = 3.0
    let horizontalCount: CGFloat = 3.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSquares(verticalCount: verticalCount, horizontalCount: horizontalCount)
        
    }
    
    func createSquares(verticalCount yCount: CGFloat, horizontalCount xCount: CGFloat) {
        
        let yCount = Int(yCount)
        let xCount = Int(xCount)
        
        for y in 0..<yCount {
            let height = self.bounds.height/CGFloat(yCount)
            let y = CGFloat(y) * height
            
            for x in 0..<xCount {
                let width = self.bounds.width/CGFloat(xCount)
                
                let x = CGFloat(x) * width
                
                let frame = CGRect(x: x, y: y, width: width, height: width)
                
                let squareView = UIView(frame: frame)
                squareView.backgroundColor = UIColor.red
                squareView.layer.borderWidth = 1
                self.addSubview(squareView)
                
                print("Hello")
            }
        }
    }
    
}
