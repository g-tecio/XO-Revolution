//
//  AiHardControls.swift
//  XO-Revolution
//
//  Created by María del Pilar López Pacheco on 8/15/18.
//  Copyright © 2018 María del Pilar López Pacheco. All rights reserved.
//

import SpriteKit

struct AiHardControls {
    
    let aiHardGameScene: AiHardScene!
    
    // Buttons and Labels Neon Skin
    let buttonMenu: SKSpriteNode
    let net: SKSpriteNode
    let oform: SKSpriteNode
    let xform:SKSpriteNode
    
    /// Buttons and Labels Halloween Skin
    let halloweenButtonMenu: SKSpriteNode
    let halloweenNet: SKSpriteNode
    let halloweenOform: SKSpriteNode
    let halloweenXform:SKSpriteNode
    
    /// Buttons and Labels October Skin
    let octoberButtonMenu: SKSpriteNode
    let octoberNet: SKSpriteNode
    let octoberOform: SKSpriteNode
    let octoberXform:SKSpriteNode
    
    init(inThisScene: AiHardScene) {
        
        aiHardGameScene = inThisScene
        
        /// Neon Skin
        net = SKSpriteNode.init(imageNamed: "Net")
        net.name = "label-Title"
        net.zPosition = 2
        
        buttonMenu = SKSpriteNode.init(imageNamed: "Menu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        
        oform = SKSpriteNode.init(imageNamed: "circle")
        oform.name = "circle"
        oform.zPosition = 4
        
        xform = SKSpriteNode.init(imageNamed: "cross")
        xform.name = "cross"
        xform.zPosition = 4
        
        /// Halloween Skin
        halloweenNet = SKSpriteNode.init(imageNamed: "Halloween_Net")
        halloweenNet.name = "label-Title"
        halloweenNet.zPosition = 2
        
        halloweenButtonMenu = SKSpriteNode.init(imageNamed: "Menu_button")
        halloweenButtonMenu.name = "buttonSprite-Menu"
        halloweenButtonMenu.zPosition = 3
        
        halloweenOform = SKSpriteNode.init(imageNamed: "Halloween_O")
        halloweenOform.name = "circle"
        halloweenOform.zPosition = 4
        
        halloweenXform = SKSpriteNode.init(imageNamed: "Halloween_X")
        halloweenXform.name = "cross"
        halloweenXform.zPosition = 4
        
        /// October Skin
        octoberNet = SKSpriteNode.init(imageNamed: "October_Net")
        octoberNet.name = "label-Title"
        octoberNet.zPosition = 2
        
        octoberButtonMenu = SKSpriteNode.init(imageNamed: "October_MenuButton")
        octoberButtonMenu.name = "buttonSprite-Menu"
        octoberButtonMenu.zPosition = 3
        
        octoberOform = SKSpriteNode.init(imageNamed: "October_O")
        octoberOform.name = "circle"
        octoberOform.zPosition = 4
        
        octoberXform = SKSpriteNode.init(imageNamed: "October_X")
        octoberXform.name = "cross"
        octoberXform.zPosition = 4
        
        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// Classic Neon Skin
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            net.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*47.39/100))
            
            oform.size = CGSize(width:(oform.size.width * (inThisScene.size.height / oform.size.height ) * (13.02/100)), height: (oform.size.height * (inThisScene.size.height / oform.size.height ) * (13.02/100)))
            xform.size = CGSize(width:(xform.size.width * (inThisScene.size.height / xform.size.height ) * (13.02/100)), height: (xform.size.height * (inThisScene.size.height / xform.size.height) * (13.02/100)))
            buttonMenu.size = CGSize(width:(buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)), height: (buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)))
            net.size = CGSize(width:(net.size.height * (inThisScene.size.height / net.size.height ) * (46.87/100)), height: (net.size.height * (inThisScene.size.height / net.size.height ) * (46.87/100)))
            
            /// Halloween Skin
            halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            halloweenNet.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*47.39/100))
            
            halloweenOform.size = CGSize(width:(halloweenOform.size.width * (inThisScene.size.height / halloweenOform.size.height ) * (13.02/100)), height: (halloweenOform.size.height * (inThisScene.size.height / halloweenOform.size.height ) * (13.02/100)))
            halloweenXform.size = CGSize(width:(halloweenXform.size.width * (inThisScene.size.height / halloweenXform.size.height ) * (13.02/100)), height: (halloweenXform.size.height * (inThisScene.size.height / halloweenXform.size.height) * (13.02/100)))
            halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)), height: (halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)))
            halloweenNet.size = CGSize(width:(halloweenNet.size.height * (inThisScene.size.height / halloweenNet.size.height ) * (46.87/100)), height: (halloweenNet.size.height * (inThisScene.size.height / halloweenNet.size.height ) * (46.87/100)))
            
            /// October Neon Skin
            octoberButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            octoberNet.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*47.39/100))
            
            octoberOform.size = CGSize(width:(octoberOform.size.width * (inThisScene.size.height / octoberOform.size.height ) * (13.02/100)), height: (octoberOform.size.height * (inThisScene.size.height / octoberOform.size.height ) * (13.02/100)))
            octoberXform.size = CGSize(width:(octoberXform.size.width * (inThisScene.size.height / octoberXform.size.height ) * (13.02/100)), height: (octoberXform.size.height * (inThisScene.size.height / octoberXform.size.height) * (13.02/100)))
            octoberButtonMenu.size = CGSize(width:(octoberButtonMenu.size.height * (inThisScene.size.height / octoberButtonMenu.size.height ) * (9.38/100)), height: (octoberButtonMenu.size.height * (inThisScene.size.height / octoberButtonMenu.size.height ) * (9.38/100)))
            octoberNet.size = CGSize(width:(octoberNet.size.height * (inThisScene.size.height / octoberNet.size.height ) * (46.87/100)), height: (octoberNet.size.height * (inThisScene.size.height / octoberNet.size.height ) * (46.87/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                
                /// Classic Neon Skin
                buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                net.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*50/100))
                
                oform.size = CGSize(width:(oform.size.width * (inThisScene.size.width / oform.size.width ) * (18.31/100)), height: (oform.size.width * (inThisScene.size.width / oform.size.width ) * (18.31/100)))
                xform.size = CGSize(width:(xform.size.width * (inThisScene.size.width / xform.size.width ) * (18.31/100)), height: (xform.size.width * (inThisScene.size.width / xform.size.width ) * (18.31/100)))
                buttonMenu.size = CGSize(width:(buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)), height: (buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)))
                net.size = CGSize(width:(net.size.width * (inThisScene.size.width / net.size.width ) * (65.92/100)), height: (net.size.width * (inThisScene.size.width / net.size.width ) * (65.92/100)))
                
                /// Halloween Skin
                halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                halloweenNet.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*50/100))
                
                halloweenOform.size = CGSize(width:(halloweenOform.size.width * (inThisScene.size.width / halloweenOform.size.width ) * (18.31/100)), height: (halloweenOform.size.width * (inThisScene.size.width / halloweenOform.size.width ) * (18.31/100)))
                halloweenXform.size = CGSize(width:(halloweenXform.size.width * (inThisScene.size.width / halloweenXform.size.width ) * (18.31/100)), height: (halloweenXform.size.width * (inThisScene.size.width / halloweenXform.size.width ) * (18.31/100)))
                halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)), height: (halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)))
                halloweenNet.size = CGSize(width:(halloweenNet.size.width * (inThisScene.size.width / halloweenNet.size.width ) * (65.92/100)), height: (halloweenNet.size.width * (inThisScene.size.width / halloweenNet.size.width ) * (65.92/100)))
                
                /// October Neon Skin
                octoberButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                octoberNet.position = CGPoint(x: aiHardGameScene.size.width/2, y: (aiHardGameScene.size.height*50/100))
                
                octoberOform.size = CGSize(width:(octoberOform.size.width * (inThisScene.size.height / octoberOform.size.height ) * (18.31/100)), height: (octoberOform.size.height * (inThisScene.size.height / octoberOform.size.height ) * (18.31/100)))
                octoberXform.size = CGSize(width:(octoberXform.size.width * (inThisScene.size.height / octoberXform.size.height ) * (18.31/100)), height: (octoberXform.size.height * (inThisScene.size.height / octoberXform.size.height) * (18.31/100)))
                octoberButtonMenu.size = CGSize(width:(octoberButtonMenu.size.width * (inThisScene.size.width / octoberButtonMenu.size.width ) * (13.18/100)), height: (octoberButtonMenu.size.width * (inThisScene.size.width / octoberButtonMenu.size.width ) * (13.18/100)))
                octoberNet.size = CGSize(width:(octoberNet.size.width * (inThisScene.size.width / octoberNet.size.width ) * (65.92/100)), height: (octoberNet.size.width * (inThisScene.size.width / octoberNet.size.width ) * (65.92/100)))
                
            }
        }
    }
}

