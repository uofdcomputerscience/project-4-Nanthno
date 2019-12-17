//
//  CompSouthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class CompSouthViewController : UIViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "CompSouth"
    
    @IBOutlet weak var itemString: UILabel!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
    }
    
    func updateImage() {
        let str = "\(imageString)\(CompSouthViewController.state).png"
        mainView.image = UIImage(named: str)
        
        forwardButton.isEnabled = (CompSouthViewController.state == 2)
        
        if GlobalData.debugMode {
            button.backgroundColor = .blue
        }
        else {
            button.backgroundColor = .clear
        }
    }
    
    func updateItem(item: Item) {
        GlobalData.item = item
        updateItem()
    }
    func updateItem() {
        itemView.image = GlobalData.getItemImage()
        itemString.text = GlobalData.getItemText()
    }
    
    @IBAction func doorTapped(_ sender: Any) {
        
        if CompSouthViewController.state == 1 {
            CompSouthViewController.state = 2
            updateImage()
        }
    }
    
}
