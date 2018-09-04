//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct DifficultyControls {
    
    
    
    /// Easy Mode Game Button
    let buttonEasy: SKSpriteNode
    
    /// Hard Mode Game Button
    let buttonHard:SKSpriteNode
    
    
    init(inThisScene: DifficultyScene) {
        
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
            buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*56.77/100))
            buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*38.03/100))
            
            /// iPhone, iPad, iPad2 and iPadMini CGSize
            buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)))
            buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad /*|| UIDevice.current.deviceType == .simulator*/ {
                
            /// iPad CGPoint
            buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.73/100))
            buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
            
            /// iPad CGSize
            buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)))
            buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)))
                
            }
            
        }
    }
}
