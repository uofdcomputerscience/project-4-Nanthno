//  InCellSouth.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit
import LiveKnob

class InCellSouthViewController : UIViewController {
    
    

    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var dial: LiveKnob!
    
    static var state = 0
    let imageString = "InCellSouth"
    
    @IBOutlet weak var itemString: UILabel!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
        forwardButton.isEnabled = (InCellSouthViewController.state == 1)
        lockView.isHidden = true
        lockView.isUserInteractionEnabled = false
        
    }
    
    @IBAction func lockButtonTapped(_ sender: Any) {
        if GlobalData.item == Item.lockPick {
            updateItem(item: Item.none)
            lockView.isHidden = false
            lockView.isUserInteractionEnabled = true
            updateImage()
        }
    }
    
    func updateImage() {
        let str = "\(imageString)\(InCellSouthViewController.state).png"
        mainView.image = UIImage(named: str)
        lockImage.image = UIImage(named: "Lock.png")
        arrowImage.image = UIImage(named: "Arrow.png")
    }
    
    func updateItem(item: Item) {
        GlobalData.item = item
        updateItem()
    }
    func updateItem() {
        itemView.image = GlobalData.getItemImage()
        itemString.text = GlobalData.getItemText()
    }
    @IBAction func dialMoved(_ sender: Any) {
        if dial.value == dial.maximumValue {
            lockView.isHidden = true
            lockView.isUserInteractionEnabled = false
            InCellSouthViewController.state = 1
            forwardButton.isEnabled = true
            updateImage()
            
        }
    }
}
