//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct DifficultyControls {
    
    /// Neon Skin
    let buttonMenu: SKSpriteNode
    let buttonEasy: SKSpriteNode
    let buttonHard:SKSpriteNode
    
    /// Halloween Skin
    let halloweenButtonMenu: SKSpriteNode
    let halloweenButtonEasy: SKSpriteNode
    let halloweenButtonHard: SKSpriteNode
    
    /// October Skin
    let octoberButtonMenu: SKSpriteNode
    let octoberButtonEasy: SKSpriteNode
    let octoberButtonHard: SKSpriteNode
    
    
    init(inThisScene: DifficultyScene) {
        
        /// Neon Skin
        buttonMenu = SKSpriteNode.init(imageNamed: "Menu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        
        buttonEasy = SKSpriteNode.init(imageNamed: "ButtonEasy")
        buttonEasy.name = "buttonSprite-Easy"
        buttonEasy.zPosition = 3
        
        buttonHard = SKSpriteNode.init(imageNamed: "ButtonHard")
        buttonHard.name = "buttonSprite-Hard"
        buttonHard.zPosition = 3
        
        /// Halloween Skin
        halloweenButtonMenu = SKSpriteNode.init(imageNamed: "Menu_button")
        halloweenButtonMenu.name = "buttonSprite-Menu"
        halloweenButtonMenu.zPosition = 3
        
        halloweenButtonEasy = SKSpriteNode.init(imageNamed: "Easy_button")
        halloweenButtonEasy.name = "buttonSprite-Easy"
        halloweenButtonEasy.zPosition = 3

        halloweenButtonHard = SKSpriteNode.init(imageNamed: "Hard_button")
        halloweenButtonHard.name = "buttonSprite-Hard"
        halloweenButtonHard.zPosition = 3
        
        /// October Skin
        octoberButtonMenu = SKSpriteNode.init(imageNamed: "October_MenuButton")
        octoberButtonMenu.name = "buttonSprite-Menu"
        octoberButtonMenu.zPosition = 3
        
        octoberButtonEasy = SKSpriteNode.init(imageNamed: "October_EasyButton")
        octoberButtonEasy.name = "buttonSprite-Easy"
        octoberButtonEasy.zPosition = 3
        
        octoberButtonHard = SKSpriteNode.init(imageNamed: "October_HardButton")
        octoberButtonHard.name = "buttonSprite-Hard"
        octoberButtonHard.zPosition = 3
        
        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            /// Classic Neon Skin
            buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            
            buttonMenu.size = CGSize(width:(buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)), height: (buttonMenu.size.height * (inThisScene.size.height / buttonMenu.size.height ) * (9.38/100)))
            buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (15.63/100)))
            buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (15.63/100)))
            
            /// Halloween Skin
            halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            halloweenButtonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            halloweenButtonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            
            halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)), height: (halloweenButtonMenu.size.height * (inThisScene.size.height / halloweenButtonMenu.size.height ) * (9.38/100)))
            halloweenButtonEasy.size = CGSize(width:(halloweenButtonEasy.size.height * (inThisScene.size.height / halloweenButtonEasy.size.height ) * (15.63/100)), height: (halloweenButtonEasy.size.height * (inThisScene.size.height / halloweenButtonEasy.size.height ) * (15.63/100)))
            halloweenButtonHard.size = CGSize(width:(halloweenButtonHard.size.height * (inThisScene.size.height / halloweenButtonHard.size.height ) * (15.63/100)), height: (halloweenButtonHard.size.height * (inThisScene.size.height / halloweenButtonHard.size.height ) * (15.63/100)))
            
            /// October Skin
            octoberButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*93.22/100))
            octoberButtonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*61.98/100))
            octoberButtonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*43.23/100))
            
            octoberButtonMenu.size = CGSize(width:(octoberButtonMenu.size.height * (inThisScene.size.height / octoberButtonMenu.size.height ) * (9.38/100)), height: (octoberButtonMenu.size.height * (inThisScene.size.height / octoberButtonMenu.size.height ) * (9.38/100)))
            octoberButtonEasy.size = CGSize(width:(octoberButtonEasy.size.height * (inThisScene.size.height / octoberButtonEasy.size.height ) * (15.63/100)), height: (octoberButtonEasy.size.height * (inThisScene.size.height / octoberButtonEasy.size.height ) * (15.63/100)))
            octoberButtonHard.size = CGSize(width:(octoberButtonHard.size.height * (inThisScene.size.height / octoberButtonHard.size.height ) * (15.63/100)), height: (octoberButtonHard.size.height * (inThisScene.size.height / octoberButtonHard.size.height ) * (15.63/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad /*|| UIDevice.current.deviceType == .simulator*/ {
                
                /// Classic Neon Skin
                buttonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.73/100))
                buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
                
                buttonMenu.size = CGSize(width:(buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)), height: (buttonMenu.size.width * (inThisScene.size.width / buttonMenu.size.width ) * (13.18/100)))
                buttonEasy.size = CGSize(width:(buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)), height: (buttonEasy.size.height * (inThisScene.size.height / buttonEasy.size.height ) * (21.96/100)))
                buttonHard.size = CGSize(width:(buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)), height: (buttonHard.size.height * (inThisScene.size.height / buttonHard.size.height ) * (21.96/100)))
                
                /// Halloween Skin
                halloweenButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                halloweenButtonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.73/100))
                halloweenButtonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
                
                halloweenButtonMenu.size = CGSize(width:(halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)), height: (halloweenButtonMenu.size.width * (inThisScene.size.width / halloweenButtonMenu.size.width ) * (13.18/100)))
                halloweenButtonEasy.size = CGSize(width:(halloweenButtonEasy.size.height * (inThisScene.size.height / halloweenButtonEasy.size.height ) * (21.96/100)), height: (halloweenButtonEasy.size.height * (inThisScene.size.height / halloweenButtonEasy.size.height ) * (21.96/100)))
                halloweenButtonHard.size = CGSize(width:(halloweenButtonHard.size.height * (inThisScene.size.height / halloweenButtonHard.size.height ) * (21.96/100)), height: (halloweenButtonHard.size.height * (inThisScene.size.height / halloweenButtonHard.size.height ) * (21.96/100)))
                
                /// October Skin
                octoberButtonMenu.position = CGPoint(x: inThisScene.size.width*9/10, y: (inThisScene.size.height*92.86/100))
                octoberButtonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*63.73/100))
                octoberButtonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*36.27/100))
                
                octoberButtonMenu.size = CGSize(width:(octoberButtonMenu.size.width * (inThisScene.size.width / octoberButtonMenu.size.width ) * (13.18/100)), height: (octoberButtonMenu.size.width * (inThisScene.size.width / octoberButtonMenu.size.width ) * (13.18/100)))
                octoberButtonEasy.size = CGSize(width:(octoberButtonEasy.size.height * (inThisScene.size.height / octoberButtonEasy.size.height ) * (21.96/100)), height: (octoberButtonEasy.size.height * (inThisScene.size.height / octoberButtonEasy.size.height ) * (21.96/100)))
                octoberButtonHard.size = CGSize(width:(octoberButtonHard.size.height * (inThisScene.size.height / octoberButtonHard.size.height ) * (21.96/100)), height: (octoberButtonHard.size.height * (inThisScene.size.height / octoberButtonHard.size.height ) * (21.96/100)))
                
            }
            
        }
    }
}
