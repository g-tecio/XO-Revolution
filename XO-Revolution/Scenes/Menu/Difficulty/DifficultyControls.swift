//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct DifficultyControls {
    
    
    let buttonMenu: SKSpriteNode
    
    /// Easy Mode Game Button
    let buttonEasy: SKSpriteNode
    
    /// Hard Mode Game Button
    let buttonHard:SKSpriteNode
    
    
    init(inThisScene: DifficultyScene) {
        
        /// Return Menu Button
        buttonMenu = SKSpriteNode.init(imageNamed: "Menu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        
        /// Play  Button
        buttonEasy = SKSpriteNode.init(imageNamed: "ButtonEasy")
        buttonEasy.name = "buttonSprite-Easy"
        buttonEasy.zPosition = 3
        
        /// Instructions  Button
        buttonHard = SKSpriteNode.init(imageNamed: "ButtonHard")
        buttonHard.name = "buttonSprite-Hard"
        buttonHard.zPosition = 3
        
        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// iPhone, iPad, iPad2 and iPadMini CGPoint
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*56.77/100))
            buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*38.03/100))
            
            /// iPhone, iPad, iPad2 and iPadMini CGSize
            buttonMenu.size = CGSize(width:(buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)), height: (buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)))
            buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)))
            buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad /*|| UIDevice.current.deviceType == .simulator*/ {
                
                /// iPad CGPoint
                buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.73/100))
                buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
                
                /// iPad CGSize
                buttonMenu.size = CGSize(width:(buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)), height: (buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)))
                buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)))
                buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)))
                
            }
            
        }
    }
}
