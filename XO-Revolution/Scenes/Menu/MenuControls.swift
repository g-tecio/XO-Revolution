//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
// let particles = SKEmitterNode(fileNamed: "Neon")!

import SpriteKit

struct MenuControls {
    
    /// Exit Button and Label
    let buttonOnePlayer: SKSpriteNode
    
    /// Game Button
    let buttonTwoPlayers:SKSpriteNode
    
//    let soundStartGame: SKAudioNode
    
    init(inThisScene: MenuScene) {
        
//        soundStartGame = SKAudioNode.init(fileNamed: "ButtonsXO")
        
        
        /// Play  Button
        buttonOnePlayer = SKSpriteNode.init(imageNamed: "ButtonPlay")
        buttonOnePlayer.name = "buttonSprite-Game"
        buttonOnePlayer.zPosition = 3
//        buttonGame.addChild(soundStartGame)
        
        /// Instructions  Button
        buttonTwoPlayers = SKSpriteNode.init(imageNamed: "Button2Players")
        buttonTwoPlayers.name = "buttonSprite-2Players"
        buttonTwoPlayers.zPosition = 3
        
        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// iPhone, iPad, iPad2 and iPadMini
            buttonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*56.77/100))
            buttonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*38.02/100))
            
            buttonOnePlayer.size = CGSize(width:(buttonOnePlayer.size.width * (inThisScene.size.width / buttonOnePlayer.size.width ) * (55.56/100)), height: (buttonOnePlayer.size.height * (inThisScene.size.height / buttonOnePlayer.size.height ) * (15.63/100)))
            buttonTwoPlayers.size = CGSize(width:(buttonTwoPlayers.size.width * (inThisScene.size.width / buttonTwoPlayers.size.width ) * (55.56/100)), height: (buttonTwoPlayers.size.height * (inThisScene.size.height / buttonTwoPlayers.size.height ) * (15.63/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
            /// iPad
            buttonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.72/100))
            buttonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
            
            buttonOnePlayer.size = CGSize(width:(buttonOnePlayer.size.width * (inThisScene.size.width / buttonOnePlayer.size.width ) * (58.59/100)), height: (buttonOnePlayer.size.height * (inThisScene.size.height / buttonOnePlayer.size.height ) * (21.96/100)))
            buttonTwoPlayers.size = CGSize(width:(buttonTwoPlayers.size.width * (inThisScene.size.width / buttonTwoPlayers.size.width ) * (58.59/100)), height: (buttonTwoPlayers.size.height * (inThisScene.size.height / buttonTwoPlayers.size.height ) * (21.96/100)))
                
            }
        }
    }
}
