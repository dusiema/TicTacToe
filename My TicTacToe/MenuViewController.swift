//
//  MenuViewController.swift
//  My TicTacToe
//
//  Created by Jay on 11/2/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {
    
    var menuView: MenuView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewSetUp() {
        self.menuView = MenuView(frame: view.frame)
        menuView?.delegate = self
        view.addSubview(menuView!)
    }
    
    func didTapPlay(didTap: Bool) {
        if didTap {
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func didTapMultiplayer(didTap: Bool) {
        if didTap {
            print("Multiplayer")
        }
    }
}
