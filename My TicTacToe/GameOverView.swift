//
//  GameOverView.swift
//  My TicTacToe
//
//  Created by Jay on 10/28/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class GameOverView: UIView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    func createView() {
        
        //Create GameOver View:
        let view = UIImageView(frame: frame)
        view.image = UIImage(named: "blackBoardBackground.png")
        view.isUserInteractionEnabled = true
        self.addSubview(view)
        
        
        let labelViewFrame = CGRect(x: self.bounds.width*0.5, y: 0, width: self.bounds.width * 0.75, height: self.bounds.height * 0.2)
        let labelView = UILabel(frame: labelViewFrame)
        labelView.text = "Game Over"
        labelView.font = labelView.font.withSize(40)
        labelView.textColor = UIColor.white
        view.addSubview(labelView)
        labelView.center = CGPoint.init(x: self.bounds.width*0.5, y: 30)
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[myView(>=748)]-|", options: .directionLeadingToTrailing, metrics: nil, views: NSDictionaryOfVariableBindings(labelView)))
        
        let restartViewFrame = CGRect(x: self.bounds.width*0.5, y: 0, width: self.bounds.width * 0.75, height: self.bounds.height * 0.2)
        let restartView = UILabel(frame: restartViewFrame)
        restartView.isUserInteractionEnabled = true
        restartView.text = "Reset"
        restartView.font = restartView.font.withSize(40)
        restartView.textColor = UIColor.red
        view.addSubview(restartView)
        restartView.center = CGPoint.init(x: self.bounds.width*0.5, y: self.bounds.width*0.9)
        
        //UITapGestureRecognizer Setup
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapRestart))
        restartView.addGestureRecognizer(tap)
    }
    
    func didTapRestart() {
        self.isHidden = true
    }
    
    
}
