//
//  OutCellNorth.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class OutCellNorthViewController : UIViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "OutCellNorth"
    
    @IBOutlet weak var itemString: UILabel!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
    }
    
    func updateImage() {
        let str = "\(imageString)\(OutCellNorthViewController.state).png"
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
