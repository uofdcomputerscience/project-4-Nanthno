//  InCellSouth.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class InCellSouthViewController : GameScreenViewController {
    
    

    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "InCellSouth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        frameWidth = mainView.frame.width
        frameHeight = mainView.frame.height
        updateImage()
        updateItem()
        forwardButton.isEnabled = (InCellSouthViewController.state == 1)
        
    }
    
    @IBAction func lockButtonTapped(_ sender: Any) {
        if GlobalData.item == Item.lockPick {
            updateItem(item: Item.none)
            InCellSouthViewController.state = 1
            forwardButton.isEnabled = true
            updateImage()
        }
    }
    
    func updateImage() {
        let str = "\(imageString)\(InCellSouthViewController.state).png"
        mainView.image = UIImage(named: str)
    }
    
    func updateItem(item: Item) {
        GlobalData.item = item
        updateItem()
    }
    func updateItem() {
        itemView.image = GlobalData.getItemImage()
        itemString.text = GlobalData.getItemText()
    }
}
