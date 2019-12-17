//
//  GlobalData.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

struct GlobalData {
    static var item : Item = Item.none
    static var debugMode = false
    
    static let itemImages = [Item.none: "BlankImage.png",
        Item.lockPick: "LockPickIcon.png",
        Item.key: "KeyIcon.png",
        Item.note: "NoteIcon.png",
        Item.pot: "PotIcon.png"]
    
    static let itemStrings = [Item.none: "Nothing",
                              Item.lockPick: "Lock Pick",
                              Item.key: "Key",
        Item.note: "Password Hint: 'You won't forget it'",
        Item.pot: "Flower Pot"]
    
    static func getItemImage() -> UIImage? {
        return UIImage(named: itemImages[item]!)
    }
    static func getItemText() -> String {
        return itemStrings[item]!
    }
    
}
