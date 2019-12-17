//
//  ConsoleViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/17/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class ConsoleViewController : UIViewController {
    
    
    @IBOutlet weak var mainView: UIImageView!
    @IBOutlet weak var itemView: UIImageView!

    static var unlocked = false
    static var state = 0
    let imageString = "Desk"
    
    @IBOutlet weak var itemString: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var passwordFlash: UIView!
    @IBOutlet weak var unlockedText: UILabel!
    
    let validPasswords:Set = ["trip", "atrip", "a trip"]
    
    override func viewDidLoad() {
        updateImage()
        updateItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        passwordField.becomeFirstResponder()
    }
    
    func updateImage() {
        let str = "\(imageString)\(ConsoleViewController.state).png"
        mainView.image = UIImage(named: str)
        if ConsoleViewController.unlocked {
            passwordStack.isHidden = true
            unlockedText.isHidden = false
        }
        else {
            passwordStack.isHidden = false
            unlockedText.isHidden = true
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
    
    @IBAction func passwordTriggered(_ sender: Any) {
        let text = passwordField.text!.lowercased()
        if validPasswords.contains(text) {
            ConsoleViewController.unlocked = true
            updateImage()
            updateItem(item: Item.none)
            CompSouthViewController.state = 1
        }
        else {
            UIView.animate(withDuration: 0.15, animations: {self.passwordFlash.alpha = 1},
                           completion: {(_: Bool) -> Void in
                            UIView.animate(withDuration: 0.15,
                                           animations: {self.passwordFlash.alpha = 0})})
        }
    }
}
