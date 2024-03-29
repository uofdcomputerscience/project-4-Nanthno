//
//  OutCellSouthViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class OutCellSouthViewController : UIViewController{
    
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "OutCellSouth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
        forwardButton.isEnabled = (OutCellSouthViewController.state > 0)
    }
    
    @IBAction func doorButtonTapped(_ sender: Any) {
        if(GlobalData.item == Item.key) {
            OutCellSouthViewController.state = 1
            forwardButton.isEnabled = true
            updateImage()
            
            updateItem(item: Item.none)
        }
    }
    
    func updateImage() {
        let str = "\(imageString)\(OutCellSouthViewController.state).png"
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
    

}
