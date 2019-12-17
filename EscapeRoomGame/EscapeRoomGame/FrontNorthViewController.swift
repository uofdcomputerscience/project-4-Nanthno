//
//  FrontNorthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class FrontNorthViewController : UIViewController{
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "FrontNorth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
        
    }
    
    func updateImage() {
        let str = "\(imageString)\(FrontNorthViewController.state).png"
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
    
    @IBAction func potTapped(_ sender: Any) {
        if FrontNorthViewController.state == 0 {
            FrontNorthViewController.state = 1
            updateItem(item: Item.pot)
            updateImage()
        }
    }
    
}
