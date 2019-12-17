//
//  InCellNorthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class InCellNorthViewController : UIViewController {
    

    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "InCellNorth"
    
    @IBOutlet weak var itemString: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()

    }
    
    func updateImage() {
        let str = "\(imageString)\(InCellNorthViewController.state).png"
        mainView.image = UIImage(named: str)
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
