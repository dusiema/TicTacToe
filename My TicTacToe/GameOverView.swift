//
//  GameOverView.swift
//  My TicTacToe
//
//  Created by Jay on 10/28/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GameOverView: UIView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    func createView() {
        
        let width = self.bounds.width
        let height = self.bounds.height
        
        //Create GameOver View:
        let view = UIImageView(frame: frame)
        view.image = UIImage(named: "blackBoardBackground.png")
        view.isUserInteractionEnabled = true
        self.addSubview(view)
        
        //Create GameOver Label:
        let gameOverLabel = createLabel(name: "Game Over", textSize: 50, borderWidth: 0)
        view.addSubview(gameOverLabel)
        gameOverLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 20, height*0.75, 20))
        }
        
        //Create Win|Lose|Tie Label:
        let winnerLabel = createLabel(name: "The Winner is: ", textSize: 30, borderWidth: 0)
        view.addSubview(winnerLabel)
        winnerLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(height*0.25, 20, height*0.5, 20))
        }
        
        //Create Rematch, Menu & Settings Buttons:
        let restartView = createLabel(name: "Rematch", textSize: 40, borderWidth: 3)
        view.addSubview(restartView)
        restartView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(height*0.5, width*0.25, 300, width*0.25))
        }
        
        
        
        //UITapGestureRecognizer Setup
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapRestart))
        restartView.addGestureRecognizer(tap)
    }
    
    
    //Create Label Function:
    func createLabel(name: String, textSize: CGFloat, borderWidth: CGFloat) -> UILabel {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = name
        label.font = UIFont(name: "Chalkduster", size: textSize)
        label.textColor = UIColor.white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = borderWidth
        label.textAlignment = .center
        label.layer.borderColor = UIColor.white.cgColor
        
        return label
    }
    
    //Rematch Label was tapped:
    func didTapRestart() {
        self.isHidden = true
    }
}
