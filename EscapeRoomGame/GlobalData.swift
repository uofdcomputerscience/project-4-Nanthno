//
//  GlobalData.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

struct GlobalData {
    var item : Item = Item.none
    
    let itemImages = [Item.LockPick: "LockPickIcon.png"]
    
    func getImage() -> UIImage {
        return UIImage(named: itemImages[item])
    }
    
}
