//
//  FieldView.swift
//  My TicTacToe
//
//  Created by Jay on 10/24/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class FieldView: UIView {
    
    var xPosition: Int?
    var yPosition: Int?
    var label: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    //Setup the label for the Board View:
    func setUpLabel() {
        let frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        label = UILabel(frame: frame)
        label?.textAlignment = .center
        label?.font = label?.font.withSize(40)
        label?.text = ""
        self.addSubview(label!)
    }
    
}
