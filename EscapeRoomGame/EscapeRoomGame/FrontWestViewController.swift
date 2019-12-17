//
//  FrontWestViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class FrontWestViewController : GameScreenViewController {
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!
    
    static var state = 0
    let maxState = 8
    let imageString = "FrontWest"
    
    @IBOutlet weak var itemString: UILabel!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        frameWidth = mainView.frame.width
        frameHeight = mainView.frame.height
        updateImage()
        updateItem()
        forwardButton.isEnabled = (FrontWestViewController.state > 0)
        
    }
    
    func updateImage() {
        let str = "\(imageString)\(FrontWestViewController.state).png"
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
    
    @IBAction func windowTapped(_ sender: Any) {
        if GlobalData.item == Item.pot {
            updateItem(item: Item.none)
            DispatchQueue.global(qos: .background).async {
                while FrontWestViewController.state < self.maxState {
                    FrontWestViewController.state += 1
                    DispatchQueue.main.async {
                        self.updateImage()
                    }
                    usleep(60000)
                }
                DispatchQueue.main.async {
                    self.forwardButton.isEnabled = true
                }
            }
        }
    }
    
}
