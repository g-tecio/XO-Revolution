//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct AiEasyControls {
	
	let aiEasyScene: AiEasyScene!
	
	/// Buttons and Labels
    let buttonMenu: SKSpriteNode
    let net: SKSpriteNode
    
    let oform: SKSpriteNode
    
    let xform:SKSpriteNode
	
	init(inThisScene: AiEasyScene) {
		
		aiEasyScene = inThisScene
        
        /// Net Image
        net = SKSpriteNode.init(imageNamed: "Net")
        net.name = "label-Title"
        net.zPosition = 2
        
        /// Return Menu Button
        buttonMenu = SKSpriteNode.init(imageNamed: "Menu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3

        oform = SKSpriteNode.init(imageNamed: "circle")
        oform.name = "circle"
        oform.zPosition = 4
//        oform.position = CGPoint(x: aiEasyScene.size.width/2, y: (aiEasyScene.size.height*35/40))
        
        xform = SKSpriteNode.init(imageNamed: "cross")
        xform.name = "cross"
        xform.zPosition = 4
//        xform.position = CGPoint(x: aiEasyScene.size.width/2, y: (aiEasyScene.size.height*35/40))
        

        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            // iPhone, iPad, iPad2 and iPadMini CGPoint
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            net.position = CGPoint(x: aiEasyScene.size.width/2, y: (aiEasyScene.size.height*47.39/100))
            
            /// iPhone, iPad, iPad2 and iPadMini CGSize
            oform.size = CGSize(width:(oform.size.width * (inThisScene.size.height / oform.size.height ) * (13.02/100)), height: (oform.size.height * (inThisScene.size.height / oform.size.height ) * (13.02/100)))
            xform.size = CGSize(width:(xform.size.width * (inThisScene.size.height / xform.size.height ) * (13.02/100)), height: (xform.size.height * (inThisScene.size.height / xform.size.height) * (13.02/100)))
            buttonMenu.size = CGSize(width:(buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)), height: (buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)))
            net.size = CGSize(width:(net.size.height * (inThisScene.size.height / net.size.height ) * (46.87/100)), height: (net.size.height * (inThisScene.size.height / net.size.height ) * (46.87/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                
                /// iPad CGPoint
                buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                net.position = CGPoint(x: aiEasyScene.size.width/2, y: (aiEasyScene.size.height*50/100))
                
                /// iPad CGSize
                oform.size = CGSize(width:(oform.size.width * (inThisScene.size.width / oform.size.width ) * (18.31/100)), height: (oform.size.width * (inThisScene.size.width / oform.size.width ) * (18.31/100)))
                xform.size = CGSize(width:(xform.size.width * (inThisScene.size.width / xform.size.width ) * (18.31/100)), height: (xform.size.width * (inThisScene.size.width / xform.size.width ) * (18.31/100)))
                buttonMenu.size = CGSize(width:(buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)), height: (buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)))
                net.size = CGSize(width:(net.size.width * (inThisScene.size.width / net.size.width ) * (65.92/100)), height: (net.size.width * (inThisScene.size.width / net.size.width ) * (65.92/100)))
                
            }
        }

	}
	
}
