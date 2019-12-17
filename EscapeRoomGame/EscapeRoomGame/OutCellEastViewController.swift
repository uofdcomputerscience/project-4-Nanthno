//
//  OutCellEastViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class OutCellEastViewController : UIViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "OutCellEast"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
        
    }
    
    @IBAction func keyButtonTapped(_ sender: Any) {
        updateItem(item: Item.key)
        OutCellEastViewController.state = 1
        updateImage()
    }
    
    func updateImage() {
        let str = "\(imageString)\(OutCellEastViewController.state).png"
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



