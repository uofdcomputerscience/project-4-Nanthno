//
//  MenuViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController {

    
    @IBOutlet weak var debugSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    @IBAction func debugSwitched(_ sender: Any) {
        GlobalData.debugMode = debugSwitch.isOn
    }
    
}
