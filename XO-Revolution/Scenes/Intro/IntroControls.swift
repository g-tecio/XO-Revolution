//
//  introControls.swift
//  XO-Revolution
//
//  Created by Raymundo Garcia on 9/3/18.
//  Copyright © 2018 María del Pilar López. All rights reserved.
//

import SpriteKit

struct IntroControls {
    
    /// Exit Button and Label
    let gtecLogo: SKSpriteNode
        
    init(inThisScene: IntroScene) {
        
        gtecLogo = SKSpriteNode.init(imageNamed: "Gtec")
        gtecLogo.name = "buttonSprite-Game"
        gtecLogo.zPosition = 2
        
        /// Resizing depending to device screen
        if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
            
            // iPhone, iPad, iPad2 and iPadMini CGPoint
            gtecLogo.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
            
            
            /// iPhone, iPad, iPad2 and iPadMini CGSize
            gtecLogo.size = CGSize(width:(gtecLogo.size.width * (inThisScene.size.width / gtecLogo.size.width ) * (33.33/100)) , height: (gtecLogo.size.height * (inThisScene.size.height / gtecLogo.size.height ) * (21.9/100)))
            
        }else{
            
            if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                
                /// iPad CGPoint
                gtecLogo.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
                
                
                /// iPad CGSize
                gtecLogo.size = CGSize(width:(gtecLogo.size.width * (inThisScene.size.width / gtecLogo.size.width ) * (26.37/100)) , height: (gtecLogo.size.height * (inThisScene.size.height / gtecLogo.size.height ) * (23.06/100)))
                
            }
        }
    }
}
