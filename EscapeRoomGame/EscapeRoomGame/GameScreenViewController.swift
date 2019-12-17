//
//  GameScreenViewController.swift
//  EscapeRoomGame
//
//  Created by Anthony Hanson on 12/16/19.
//  Copyright © 2019 Anthony Hanson. All rights reserved.
//

import UIKit

class GameScreenViewController : UIViewController {
    
    let imageWidth = CGFloat(128)
    let imageHeight = CGFloat(180)
    var frameWidth = CGFloat(0)
    var frameHeight = CGFloat(0)
    
    func convertTapToImg(_ point: CGPoint, tap: UITapGestureRecognizer) -> CGPoint? {
        let xRatio = frameWidth / imageWidth
        let yRatio = frameHeight / imageHeight
        let ratio = min(xRatio, yRatio)
        
        let imgWidth = imageWidth * ratio
        let imgHeight = imageHeight * ratio
        
        var tap = point
        var borderWidth: CGFloat = 0
        var borderHeight: CGFloat = 0
        // detect border
        if ratio == yRatio {
            // border is left and right
            borderWidth = (frameWidth - imgWidth) / 2
            if point.x < borderWidth || point.x > borderWidth + imgWidth {
                return nil
            }
            tap.x -= borderWidth
        } else {
            // border is top and bottom
            borderHeight = (frameHeight - imgHeight) / 2
            if point.y < borderHeight || point.y > borderHeight + imgHeight {
                return nil
            }
            tap.y -= borderHeight
        }
        
        let xScale = tap.x / (frameWidth - 2 * borderWidth)
        let yScale = tap.y / (frameHeight - 2 * borderHeight)
        let pixelX = imageWidth * xScale
        let pixelY = imageHeight * yScale
        return CGPoint(x: pixelX, y: pixelY)
    }
    
}
