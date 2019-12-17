//
//  InCellNorthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class InCellNorthViewController : GameScreenViewController {
    

    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "InCellNorth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        frameWidth = mainView.frame.width
        frameHeight = mainView.frame.height
        updateImage()
        updateItem()
        forwardButton.isEnabled = false

    }
    
    func updateImage() {
        let str = "\(imageString)\(InCellNorthViewController.state).png"
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

    
    @IBAction func pillowTapped(_ sender: Any) {
        if InCellNorthViewController.state == 0 {
            InCellNorthViewController.state = 1
            updateImage()
        }
        else if InCellNorthViewController.state == 1 {
            InCellNorthViewController.state = 2
            updateItem(item: Item.lockPick)
            updateImage()
        }
    }
}
