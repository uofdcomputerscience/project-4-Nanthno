///Users/ahanson/Projects/MobileDev/project-4-Nanthno/EscapeRoomGame/EscapeRoomGame/OutCellEastViewController.swift
//  blankViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class blankViewController : GameScreenViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let imageString = "OutCellEast"
    
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
        let str = "\(imageString)\(OutCellEastViewController.state).png"
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
