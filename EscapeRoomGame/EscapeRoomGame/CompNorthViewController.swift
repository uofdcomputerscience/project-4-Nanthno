//
//  CompNorthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class CompNorthViewController : UIViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "CompNorth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
        
    }
    
    func updateImage() {
        let str = "\(imageString)\(CompNorthViewController.state).png"
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
    
    @IBAction func drawerTapped(_ sender: Any) {
        if CompNorthViewController.state == 0 {
            CompNorthViewController.state = 1
            CompWestViewController.state = 1
            updateImage()
        }
        else if CompNorthViewController.state == 1 {
            CompNorthViewController.state = 2
            CompWestViewController.state = 2
            updateItem(item: Item.note)
            updateImage()
        }
    }
    
}
