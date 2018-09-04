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
    
    //    let soundStartGame: SKAudioNode
    
    init(inThisScene: IntroScene) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            gtecLogo = SKSpriteNode.init(imageNamed: "Gtec")
            gtecLogo.name = "buttonSprite-Game"
            gtecLogo.zPosition = 2
            gtecLogo.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*6/10))
            
            gtecLogo.size = CGSize(width:(gtecLogo.size.width * (inThisScene.size.width / gtecLogo.size.width ) * (17.57/100)) , height: (gtecLogo.size.height * (inThisScene.size.height / gtecLogo.size.height ) * (15.37/100)))

        }else{
            
            /// Play  Button
            gtecLogo = SKSpriteNode.init(imageNamed: "Gtec")
            gtecLogo.name = "buttonSprite-Game"
            gtecLogo.zPosition = 2
            gtecLogo.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*5/10))
            
            /// Resizing depending to screen size
            let resizeFactorX:CGFloat = inThisScene.size.width/360.0
            let resizeFactorY:CGFloat = inThisScene.size.height/420.0
            let originalSize = gtecLogo.size
            gtecLogo.size = CGSize(width: originalSize.width*resizeFactorX*33.33/100, height: originalSize.height*resizeFactorY*21.88/100)
            
        }
        
    }
    
}
