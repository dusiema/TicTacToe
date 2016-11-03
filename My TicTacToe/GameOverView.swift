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
    
    //Create the GameOver View:
    func createView() {
        //Set the Width & Height constants for the constraints:
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
        
        //Create Win||Tie Label:
        let winnerLabel = createLabel(name: "The Winner is: ", textSize: 30, borderWidth: 0)
        view.addSubview(winnerLabel)
        winnerLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(height*0.25, 20, height*0.5, 20))
        }
        
        //Create Menu Label:
        let menuLabel = createButton(name: "Menu", textSize: 40, borderWidth: 3)
        view.addSubview(menuLabel)
        menuLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.width.equalTo(215)
            make.height.equalTo(60)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        //Create Rematch Label:
        let restartLabel = createButton(name: "Rematch", textSize: 30, borderWidth: 3)
        view.addSubview(restartLabel)
        restartLabel.addTarget(self, action: #selector(GameOverView.didTapRestart), for: .touchUpInside)
        restartLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(menuLabel.snp.top).offset(-20)
            make.width.equalTo(menuLabel.snp.width)
            make.height.equalTo(60)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        //UITapGestureRecognizer Setup
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapRestart))
        restartLabel.addGestureRecognizer(tap)
    }
    
    
    //Create Labels:
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
    
    //Create Buttons:
    func createButton(name: String, textSize: CGFloat, borderWidth: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(name, for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: textSize)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = borderWidth
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.setTitleColor(UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1), for: UIControlState.highlighted)
        button.setBackgroundImage(UIImage.fromColor(color: UIColor.white), for: UIControlState.highlighted)
        return button
    }
    
    //Rematch Label was tapped:
    func didTapRestart() {
        self.isHidden = true
    }
}

//Use UIColor as a UIImage Background:
extension UIImage {
    static func fromColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
