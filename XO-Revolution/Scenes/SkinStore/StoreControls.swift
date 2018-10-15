//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
// let particles = SKEmitterNode(fileNamed: "Neon")!

import SpriteKit

struct StoreControls {
    
    /// Single Player Button
    let buttonNeonClassic: SKSpriteNode
    let buttonMenu: SKSpriteNode
    
    /// Skin Store Button
    let buttonHalloween:SKSpriteNode
    let halloweenButtonMenu: SKSpriteNode
    
    init(inThisScene: StoreScene) {
        
        /// Sibgle player Button
        buttonMenu = SKSpriteNode.init(imageNamed: "Menu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        
        buttonNeonClassic = SKSpriteNode.init(imageNamed: "Neon_Classic")
        buttonNeonClassic.name = "buttonSprite-ClassicSkin"
        buttonNeonClassic.zPosition = 3
        
        /// Skin Store Button
        halloweenButtonMenu = SKSpriteNode.init(imageNamed: "Menu_button")
        halloweenButtonMenu.name = "buttonSprite-Menu"
        halloweenButtonMenu.zPosition = 3
        
        buttonHalloween = SKSpriteNode.init(imageNamed: "Halloween_Icon")
        buttonHalloween.name = "buttonSprite-HalloweenSkin"
        buttonHalloween.zPosition = 3
        
        /// Resizing depending to device screen: iPhone, iPad, iPad2 and iPadMini
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// Classic Neon
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            buttonNeonClassic.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            
            buttonMenu.size = CGSize(width:(buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)), height: (buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)))
            buttonNeonClassic.size = CGSize(width:(buttonNeonClassic.size.width * (inThisScene.size.width / buttonNeonClassic.size.width ) * (27.77/100)), height: (buttonNeonClassic.size.height * (inThisScene.size.height / buttonNeonClassic.size.height ) * (15.63/100)))
            
            /// Halloween
            halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            buttonHalloween.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            
            halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)), height: (halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)))
            buttonHalloween.size = CGSize(width:(buttonHalloween.size.width * (inThisScene.size.width / buttonHalloween.size.width ) * (27.77/100)), height: (buttonHalloween.size.height * (inThisScene.size.height / buttonHalloween.size.height ) * (15.63/100)))
            
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
            /// Classic Neon
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
            buttonNeonClassic.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*67.39/100))
            
            buttonMenu.size = CGSize(width:(buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)), height: (buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)))
            buttonNeonClassic.size = CGSize(width:(buttonNeonClassic.size.height * (inThisScene.size.height / buttonNeonClassic.size.height ) * (21.96/100)), height: (buttonNeonClassic.size.height * (inThisScene.size.height / buttonNeonClassic.size.height ) * (21.96/100)))
            
            /// Halloween
            halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
            buttonHalloween.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*39.93/100))
            
           halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)), height: (halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)))
            buttonHalloween.size = CGSize(width:(buttonHalloween.size.height * (inThisScene.size.height / buttonHalloween.size.height ) * (21.96/100)), height: (buttonHalloween.size.height * (inThisScene.size.height / buttonHalloween.size.height ) * (21.96/100)))
                
            }
        }
    }
}
