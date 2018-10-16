//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
// let particles = SKEmitterNode(fileNamed: "Neon")!

import SpriteKit

struct MenuControls {
    
    /// Buttons Clasicc Neon
    let buttonOnePlayer: SKSpriteNode
    let buttonTwoPlayers:SKSpriteNode
    let buttonStore:SKSpriteNode
    
    /// Halloween Buttons
    let halloweenButtonOnePlayer: SKSpriteNode
    let halloweenButtonTwoPlayers:SKSpriteNode
    let halloweenButtonStore:SKSpriteNode
    
    /// October Buttons
    let octoberButtonOnePlayer: SKSpriteNode
    let octoberButtonTwoPlayers:SKSpriteNode
    let octoberButtonStore:SKSpriteNode
    
    /// Sounds
    let onePlayerSound = SKAction.playSoundFileNamed("Laugh", waitForCompletion: false)
    let twoPlayersSound = SKAction.playSoundFileNamed("HalloweenOrgan", waitForCompletion: false)
    
    init(inThisScene: MenuScene) {
        
        /// Neon Skin
        buttonOnePlayer = SKSpriteNode.init(imageNamed: "ButtonPlay")
        buttonOnePlayer.name = "buttonSprite-Game"
        buttonOnePlayer.zPosition = 3
        
        buttonTwoPlayers = SKSpriteNode.init(imageNamed: "Button2Players")
        buttonTwoPlayers.name = "buttonSprite-2Players"
        buttonTwoPlayers.zPosition = 3
        
        buttonStore = SKSpriteNode.init(imageNamed: "ButtonSkins")
        buttonStore.name = "buttonSprite-SkinStore"
        buttonStore.zPosition = 3
        
        /// Halloween Skin
        halloweenButtonOnePlayer = SKSpriteNode.init(imageNamed: "One_player_button")
        halloweenButtonOnePlayer.name = "buttonSprite-Game"
        halloweenButtonOnePlayer.zPosition = 3
        
        halloweenButtonTwoPlayers = SKSpriteNode.init(imageNamed: "Two_players_button")
        halloweenButtonTwoPlayers.name = "buttonSprite-2Players"
        halloweenButtonTwoPlayers.zPosition = 3
        
        halloweenButtonStore = SKSpriteNode.init(imageNamed: "Skin_button")
        halloweenButtonStore.name = "buttonSprite-SkinStore"
        halloweenButtonStore.zPosition = 3
        
        /// October Skin
        octoberButtonOnePlayer = SKSpriteNode.init(imageNamed: "October_OnePlayerButton")
        octoberButtonOnePlayer.name = "buttonSprite-Game"
        octoberButtonOnePlayer.zPosition = 3
        
        octoberButtonTwoPlayers = SKSpriteNode.init(imageNamed: "October_TwoPlayersButton")
        octoberButtonTwoPlayers.name = "buttonSprite-2Players"
        octoberButtonTwoPlayers.zPosition = 3
        
        octoberButtonStore = SKSpriteNode.init(imageNamed: "ButtonSkins")
        octoberButtonStore.name = "buttonSprite-SkinStore"
        octoberButtonStore.zPosition = 3
        
        /// Resizing depending to device screen: iPhone, iPad, iPad2 and iPadMini
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// Classic Neon Skin
            buttonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            buttonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            buttonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*24.48/100))
            
            buttonOnePlayer.size = CGSize(width:(buttonOnePlayer.size.width * (inThisScene.size.width / buttonOnePlayer.size.width ) * (55.56/100)), height: (buttonOnePlayer.size.height * (inThisScene.size.height / buttonOnePlayer.size.height ) * (15.63/100)))
            buttonTwoPlayers.size = CGSize(width:(buttonTwoPlayers.size.width * (inThisScene.size.width / buttonTwoPlayers.size.width ) * (55.56/100)), height: (buttonTwoPlayers.size.height * (inThisScene.size.height / buttonTwoPlayers.size.height ) * (15.63/100)))
            buttonStore.size = CGSize(width:(buttonStore.size.width * (inThisScene.size.width / buttonStore.size.width ) * (27.78/100)), height: (buttonStore.size.height * (inThisScene.size.height / buttonStore.size.height ) * (15.63/100)))
            
            /// Halloween Skin
            halloweenButtonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            halloweenButtonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            halloweenButtonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*24.48/100))
            
            halloweenButtonOnePlayer.size = CGSize(width:(halloweenButtonOnePlayer.size.width * (inThisScene.size.width / halloweenButtonOnePlayer.size.width ) * (55.56/100)), height: (halloweenButtonOnePlayer.size.height * (inThisScene.size.height / halloweenButtonOnePlayer.size.height ) * (15.63/100)))
            halloweenButtonTwoPlayers.size = CGSize(width:(halloweenButtonTwoPlayers.size.width * (inThisScene.size.width / halloweenButtonTwoPlayers.size.width ) * (55.56/100)), height: (halloweenButtonTwoPlayers.size.height * (inThisScene.size.height / halloweenButtonTwoPlayers.size.height ) * (15.63/100)))
            halloweenButtonStore.size = CGSize(width:(halloweenButtonStore.size.width * (inThisScene.size.width / halloweenButtonStore.size.width ) * (27.78/100)), height: (halloweenButtonStore.size.height * (inThisScene.size.height / halloweenButtonStore.size.height ) * (15.63/100)))
            
            /// October Skin
            octoberButtonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            octoberButtonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            octoberButtonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*24.48/100))
            
            octoberButtonOnePlayer.size = CGSize(width:(octoberButtonOnePlayer.size.width * (inThisScene.size.width / octoberButtonOnePlayer.size.width ) * (55.56/100)), height: (octoberButtonOnePlayer.size.height * (inThisScene.size.height / octoberButtonOnePlayer.size.height ) * (15.63/100)))
            octoberButtonTwoPlayers.size = CGSize(width:(octoberButtonTwoPlayers.size.width * (inThisScene.size.width / octoberButtonTwoPlayers.size.width ) * (55.56/100)), height: (octoberButtonTwoPlayers.size.height * (inThisScene.size.height / octoberButtonTwoPlayers.size.height ) * (15.63/100)))
            octoberButtonStore.size = CGSize(width:(octoberButtonStore.size.width * (inThisScene.size.width / octoberButtonStore.size.width ) * (27.78/100)), height: (octoberButtonStore.size.height * (inThisScene.size.height / octoberButtonStore.size.height ) * (15.63/100)))
            
            
        }else{
            /// Ipad
            if UIDevice.current.userInterfaceIdiom == .pad {
                
                /// Classic Neon Skin
                buttonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*67.39/100))
                buttonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*39.93/100))
                buttonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*15.23/100))
                
                buttonOnePlayer.size = CGSize(width:(buttonOnePlayer.size.width * (inThisScene.size.width / buttonOnePlayer.size.width ) * (58.59/100)), height: (buttonOnePlayer.size.height * (inThisScene.size.height / buttonOnePlayer.size.height ) * (21.96/100)))
                buttonTwoPlayers.size = CGSize(width:(buttonTwoPlayers.size.width * (inThisScene.size.width / buttonTwoPlayers.size.width ) * (58.59/100)), height: (buttonTwoPlayers.size.height * (inThisScene.size.height / buttonTwoPlayers.size.height ) * (21.96/100)))
                buttonStore.size = CGSize(width:(buttonStore.size.width * (inThisScene.size.width / buttonStore.size.width ) * (29.30/100)), height: (buttonStore.size.height * (inThisScene.size.height / buttonStore.size.height ) * (21.96/100)))
                
                /// Halloween Skin
                halloweenButtonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*67.39/100))
                halloweenButtonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*39.93/100))
                halloweenButtonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*15.23/100))
                
                halloweenButtonOnePlayer.size = CGSize(width:(halloweenButtonOnePlayer.size.width * (inThisScene.size.width / halloweenButtonOnePlayer.size.width ) * (58.59/100)), height: (halloweenButtonOnePlayer.size.height * (inThisScene.size.height / halloweenButtonOnePlayer.size.height ) * (21.96/100)))
                halloweenButtonTwoPlayers.size = CGSize(width:(halloweenButtonTwoPlayers.size.width * (inThisScene.size.width / halloweenButtonTwoPlayers.size.width ) * (58.59/100)), height: (halloweenButtonTwoPlayers.size.height * (inThisScene.size.height / halloweenButtonTwoPlayers.size.height ) * (21.96/100)))
                halloweenButtonStore.size = CGSize(width:(halloweenButtonStore.size.width * (inThisScene.size.width / halloweenButtonStore.size.width ) * (29.30/100)), height: (halloweenButtonStore.size.height * (inThisScene.size.height / halloweenButtonStore.size.height ) * (21.96/100)))
                
                /// October Skin
                octoberButtonOnePlayer.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*67.39/100))
                octoberButtonTwoPlayers.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*39.93/100))
                octoberButtonStore.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*15.23/100))
                
                octoberButtonOnePlayer.size = CGSize(width:(octoberButtonOnePlayer.size.width * (inThisScene.size.width / octoberButtonOnePlayer.size.width ) * (58.59/100)), height: (octoberButtonOnePlayer.size.height * (inThisScene.size.height / octoberButtonOnePlayer.size.height ) * (21.96/100)))
                octoberButtonTwoPlayers.size = CGSize(width:(octoberButtonTwoPlayers.size.width * (inThisScene.size.width / octoberButtonTwoPlayers.size.width ) * (58.59/100)), height: (octoberButtonTwoPlayers.size.height * (inThisScene.size.height / octoberButtonTwoPlayers.size.height ) * (21.96/100)))
                octoberButtonStore.size = CGSize(width:(octoberButtonStore.size.width * (inThisScene.size.width / octoberButtonStore.size.width ) * (29.30/100)), height: (octoberButtonStore.size.height * (inThisScene.size.height / octoberButtonStore.size.height ) * (21.96/100)))
                
            }
        }
    }
}
