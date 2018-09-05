//
//  AiHardGame.swift
//  XO-Revolution
//
//  Created by María del Pilar López Pacheco on 8/15/18.
//  Copyright © 2018 María del Pilar López Pacheco. All rights reserved.
//

import SpriteKit
import GameKit

class AiHardGame {
    
    // Game Scene
    let aiHardGameScene: AiHardScene!
    
    /// Game Controls
    var aiHardGameControls: AiHardControls!
    
    // Arrays of Sprites
    var placeholder : [SKShapeNode] = []
    var elementSprite: [SKSpriteNode] = []
    
    var xOne: SKSpriteNode = SKSpriteNode.init()
    var xTwo: SKSpriteNode = SKSpriteNode.init()
    var xThree: SKSpriteNode = SKSpriteNode.init()
    
    var oOne: SKSpriteNode = SKSpriteNode.init()
    var oTwo: SKSpriteNode = SKSpriteNode.init()
    var oThree: SKSpriteNode = SKSpriteNode.init()
    
    var i = 0
    var vul = true
    var counter = 0
    
    var gameState : Int
    var board : [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
    
    /// Sounds
    let xPlaceSound = SKAction.playSoundFileNamed("Xsound", waitForCompletion: false)
    let oPlaceSound = SKAction.playSoundFileNamed("Osound", waitForCompletion: false)
    let winSound = SKAction.playSoundFileNamed("WinXO", waitForCompletion: false)
    let loseSound = SKAction.playSoundFileNamed("LoseXO", waitForCompletion: false)
    let tieSound = SKAction.playSoundFileNamed("TieXO", waitForCompletion: false)
    
    init(inThisScene: AiHardScene) {
        
        aiHardGameScene = inThisScene
        
        self.aiHardGameScene.isUserInteractionEnabled = true
        
        /// Painting placeholders
        for x in -1...1 {
            for y in -1...1 {
                
                if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
                    
                    placeholder.append(SKShapeNode(rectOf: aiHardGameScene.aiHardGameControls.oform.size))
                    let valX = (aiHardGameScene.size.width/2) + ((inThisScene.size.width/3.6) * CGFloat( x) )
                    let valY = (aiHardGameScene.size.height*4.75/10) - ((inThisScene.size.height/6.4) * CGFloat( y) )
                    
                    placeholder[i].position = CGPoint(x: valX, y: valY)
                    placeholder[i].fillColor = .clear
                    placeholder[i].strokeColor = .clear
                    placeholder[i].zPosition = 4
                    placeholder[i].name = "Position \(i)"
                    
                    i += 1
                    
                }else{
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        // TODO: Works with iPhone 6, needs to be resized to other formats
                        placeholder.append(SKShapeNode(rectOf: aiHardGameScene.aiHardGameControls.oform.size))
                        let valX = (aiHardGameScene.size.width/2) + ((inThisScene.size.width/4.5) * CGFloat( x) )
                        let valY = (aiHardGameScene.size.height*5/10) - ((inThisScene.size.height/6.18) * CGFloat( y) )
                        
                        placeholder[i].position = CGPoint(x: valX, y: valY)
                        placeholder[i].fillColor = .clear
                        placeholder[i].strokeColor = .clear
                        placeholder[i].zPosition = 4
                        placeholder[i].name = "Position \(i)"
                        
                        i += 1
                    }
                }
            }
        }
        /// Game Variables
        gameState = 1
        
    }
    
    func randomNumber(MIN: Int, MAX: Int)-> Int{
        return Int(arc4random_uniform(UInt32(MAX-MIN)) + UInt32(MIN));
    }
    
    func paintElement(position: Int) {
        // Check gameState
        if gameState == 1 {
            elementSprite.append(SKSpriteNode.init(imageNamed:"cross"))
        }
        if gameState == 2 {
            elementSprite.append(SKSpriteNode.init(imageNamed:"circle"))
        }
        // Paint Element
        placeholder[position].isHidden = true
        elementSprite.last?.position = placeholder[position].position
        elementSprite.last?.size = aiHardGameScene.aiHardGameControls.oform.size
        elementSprite.last!.zPosition = 5
        aiHardGameScene.addChild(elementSprite.last!)
        
        // Set gameState
        gameState = gameStateMachine(lastState: gameState)
    }
    
    func inputValue(posX: Int, posY: Int, value: Int) -> Bool {
        
        if ( board[posX][posY] == 0 ){
            if gameState == 1 {
                board[posX][posY] = 1
                paintElement(position: posX + (posY * 3))
                
            }
            if gameState == 2{
                counter = counter + 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    self.moveHardAI(count: self.counter)
                }
                
            }
            return true
        }
        else {
            return false
        }
    }
    
    /// AI Easy
    func moveAI(){
        var posOx = 0
        var posOy = 0
        
        posOx = randomNumber(MIN: 0, MAX: 3)
        posOy = randomNumber(MIN: 0, MAX: 3)
        
        if(board[posOx][posOy] == 0 ){
            board[posOx][posOy] = 2
            paintElement(position: posOx + (posOy * 3))
        }else{
            moveAI()
        }
    }
    
    /// Move Corner
    func moveCornerRandom(){
        var corner = 0
        
        corner = randomNumber(MIN: 0, MAX: 4)
        
        if(corner == 0 ){
            if(board[0][0] == 0){
                board[0][0] = 2
                paintElement(position: 0 + (0 * 3))
            }else{
                moveCornerRandom()
            }
        }
        if(corner == 1 ){
            if(board[0][2] == 0){
                board[0][2] = 2
                paintElement(position: 0 + (2 * 3))
            }else{
                moveCornerRandom()
            }
        }
        if(corner == 2 ){
            if(board[2][0] == 0){
                board[2][0] = 2
                paintElement(position: 2 + (0 * 3))
            }else{
                moveCornerRandom()
            }
        }
        if(corner == 3 ){
            if(board[2][2] == 0){
                board[2][2] = 2
                paintElement(position: 2 + (2 * 3))
            }else{
                moveCornerRandom()
            }
        }
    }
    
    /// Oppossite corner
    func opCorner(){
        var posOxHard = 0
        var posOyHard = 0
        
        if(board[1][1] == 0){
            posOxHard = 1
            posOyHard = 1
            if(board[posOxHard][posOyHard] == 0){
                board[posOxHard][posOyHard] = 2
                paintElement(position: posOxHard + (posOyHard * 3))
            }//1,1
        }
        
    }
    
    ///Oppossite Middle
    func opCenter(){
        var posOxHard = 0
        var posOyHard = 0
        
        if(board[0][1] == 1){
            posOxHard = 2
            posOyHard = 1
            if(board[posOxHard][posOyHard] == 0){
                board[posOxHard][posOyHard] = 2
                paintElement(position: posOxHard + (posOyHard * 3))
                return
            }//2,1
        }
        if(board[1][2] == 1){
            posOxHard = 1
            posOyHard = 0
            if(board[posOxHard][posOyHard] == 0){
                board[posOxHard][posOyHard] = 2
                paintElement(position: posOxHard + (posOyHard * 3))
                return
            }//1,0
        }
        if(board[2][1] == 1){
            posOxHard = 0
            posOyHard = 1
            if(board[posOxHard][posOyHard] == 0){
                board[posOxHard][posOyHard] = 2
                paintElement(position: posOxHard + (posOyHard * 3))
                return
            }//0,1
        }
        if(board[1][0] == 1){
            posOxHard = 1
            posOyHard = 2
            if(board[posOxHard][posOyHard] == 0){
                board[posOxHard][posOyHard] = 2
                paintElement(position: posOxHard + (posOyHard * 3))
                return
            }//1,2
        }
    }
    
    func moveHardAI(count: Int){
        
        var posOxHard = 0
        var posOyHard = 0
        
        if gameState == 2 {
            
            
            if(count == 1){
                if(board[1][1] == 1){
                    moveCornerRandom()
                    return
                }
                /// Corner Play
                if(board[0][0] == 1 || board[0][2] == 1 || board[2][2] == 1 || board[2][0] == 1){
                    opCorner()
                    return
                }
                if(board[0][1] == 1 || board[1][2] == 1 || board[2][1] == 1 || board[1][0] == 1){
                    opCenter()
                    return
                }
            }//END firts move
            
            //Finish Move
            if(board[0][0] == 2){
                // 1 lane vertical
                if(board[1][0] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//1,0
                if(board[2][0] == 2){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//2,0
                //1 line diagonal
                if(board[1][1] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//1,1
                if(board[2][2] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,2
                //1 line horizontal
                if(board[0][1] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//0,1
                if(board[0][2] == 2){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//0,2
            }//0,0
            
            if(board[0][1] == 2){
                if(board[0][0] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//0,0
                if(board[0][2] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//0,2
                if(board[1][1] == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//1,1
                if(board[2][1] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,1
            }//0,1
            
            if(board[0][2] == 2){
                if(board[0][1] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//0,1
                if(board[0][0] == 2){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//0,0
                if(board[1][1] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//1,1
                if(board[2][0] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,0
                if(board[1][2] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//1,2
                if(board[2][2] == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//2,2
            }//0,2
            
            if(board[1][0] == 2){
                if(board[0][0] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//0,0
                if(board[2][0] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//2,0
                if(board[1][1] == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//1,1
                if(board[1][2] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//1,2
            }//1,0
            
            if(board[1][1] == 2){
                if(board[0][0] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//0,0
                if(board[2][2] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//2,2
                if(board[0][1] == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//0,1
                if(board[2][1] == 2){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//2,1
                if(board[0][2] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//0,2
                if(board[2][0] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//2,0
                if(board[1][2] == 2){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//1,2
                if(board[1][0] == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//1,0
            }//1,1
            
            if(board[1][2] == 2){
                if(board[1][1] == 2){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//1,1
                if(board[1][0] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//1,0
                if(board[0][2] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//0,2
                if(board[2][2] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//2,2
            }//1,2
            
            if(board[2][0] == 2){
                if(board[1][0] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//1,0
                if(board[0][0] == 2){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//0,0
                if(board[1][1] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//1,1
                if(board[0][2] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,2
                if(board[2][1] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//2,1
                if(board[2][2] == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//2,2
            }//2,0
            
            if(board[2][1] == 2){
                if(board[2][0] == 2){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//2,0
                if(board[2][2] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//2,2
                if(board[1][1] == 2){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//1,1
                if(board[0][1] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,1
            }//2,1
            
            if(board[2][2] == 2){
                if(board[2][0] == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//2,0
                if(board[2][1] == 2){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//2,1
                if(board[1][1] == 2){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//1,1
                if(board[0][0] == 2){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,0
                if(board[1][2] == 2){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//1,2
                if(board[0][2] == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//0,2
            }//2,2
            
            //End finish move
            
            // Block Winner Move
            if(board[0][0] == 1){
                // 1 lane vertical
                if(board[1][0] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//1,0
                if(board[2][0] == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//2,0
                //1 line diagonal
                if(board[1][1] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//1,1
                if(board[2][2] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,2
                //1 line horizontal
                if(board[0][1] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//0,1
                if(board[0][2] == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//0,2
            }//0,0
            
            if(board[0][1] == 1){
                if(board[0][0] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//0,0
                if(board[0][2] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//0,2
                if(board[1][1] == 1){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//1,1
                if(board[2][1] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,1
            }//0,1
            
            if(board[0][2] == 1){
                if(board[0][1] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//0,1
                if(board[0][0] == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//0,0
                if(board[1][1] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//1,1
                if(board[2][0] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//2,0
                if(board[1][2] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//1,2
                if(board[2][2] == 1){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//2,2
            }//0,2
            
            if(board[1][0] == 1){
                if(board[0][0] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//0,0
                if(board[2][0] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//2,0
                if(board[1][1] == 1){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//1,1
                if(board[1][2] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//1,2
            }//1,0
            
            if(board[1][1] == 1){
                if(board[0][0] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//0,0
                if(board[2][2] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//2,2
                if(board[0][1] == 1){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//0,1
                if(board[2][1] == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//2,1
                if(board[0][2] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//0,2
                if(board[2][0] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//2,0
                if(board[1][2] == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//1,2
                if(board[1][0] == 1){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//1,0
            }//1,1
            
            if(board[1][2] == 1){
                if(board[1][1] == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//1,1
                if(board[1][0] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//1,0
                if(board[0][2] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//0,2
                if(board[2][2] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//2,2
            }//1,2
            
            if(board[2][0] == 1){
                if(board[1][0] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//1,0
                if(board[0][0] == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }//0,0
                if(board[1][1] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//1,1
                if(board[0][2] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,2
                if(board[2][1] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//2,1
                if(board[2][2] == 1){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//2,2
            }//2,0
            
            if(board[2][1] == 1){
                if(board[2][0] == 1){
                    posOxHard = 2
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,2
                }//2,0
                if(board[2][2] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//2,2
                if(board[1][1] == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }//1,1
                if(board[0][1] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,1
            }//2,1
            
            if(board[2][2] == 1){
                if(board[2][0] == 1){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }//2,0
                if(board[2][1] == 1){
                    posOxHard = 2
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,0
                }//2,1
                if(board[1][1] == 1){
                    posOxHard = 0
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,0
                }//1,1
                if(board[0][0] == 1){
                    posOxHard = 1
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,1
                }//0,0
                if(board[1][2] == 1){
                    posOxHard = 0
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,2
                }//1,2
                if(board[0][2] == 1){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }//0,2
            }//2,2
            //End Block
            
            // Wining Move
            if(board[0][1] == 2 && board[2][2] == 2){
                posOxHard = 2
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,1
            }
            if(board[0][1] == 2 && board[2][0] == 2){
                posOxHard = 2
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,1
            }
            
            if(board[0][0] == 2 && board[1][2] == 2){
                posOxHard = 1
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,0
            }
            if(board[2][0] == 2 && board[1][2] == 2){
                posOxHard = 1
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,0
            }
            
            if(board[0][0] == 2 && board[2][1] == 2){
                posOxHard = 0
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,1
            }
            if(board[0][2] == 2 && board[2][1] == 2){
                posOxHard = 0
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,1
            }
            
            if(board[0][2] == 2 && board[1][0] == 2){
                posOxHard = 1
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,2
            }
            if(board[2][2] == 2 && board[1][0] == 2){
                posOxHard = 1
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,2
            }
            //End wining move
            
            //Move to next corner
            //0,0
            if(board[0][0] == 1 && board[0][1] == 1 && board[0][2] != 0 && board[2][2] != 0){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[0][0] == 1 && board[1][0] == 1 && board[2][0] != 0 && board[2][2] != 0){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            
            //0,2
            if(board[0][0] != 0 && board[2][0] != 0 && board[0][2] == 1 && board[0][1] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            if(board[2][0] != 0 && board[2][2] != 0 && board[0][2] == 1 && board[1][2] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            
            //2,2
            if(board[0][0] != 0 && board[0][2] != 0 && board[2][2] == 1 && board[1][2] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[0][0] != 0 && board[2][0] != 0 && board[2][2] == 1 && board[2][1] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            
            //2,0
            if(board[0][0] != 0 && board[0][2] != 0 && board[2][0] == 1 && board[1][0] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            if(board[2][2] != 0 && board[0][2] != 0 && board[2][0] == 1 && board[2][1] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            //End of the move next corner
            
            //Move to center
            if(board[0][0] != 0 && board[0][2] != 0 && board[2][2] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[0][0] != 0 && board[2][2] != 0 && board[2][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[0][0] != 0 && board[0][2] != 0 && board[2][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            
            if(board[0][2] != 0 && board[2][2] != 0 && board[2][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[0][2] != 0 && board[2][2] != 0 && board[0][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[0][2] != 0 && board[2][0] != 0 && board[0][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            
            if(board[2][2] != 0 && board[2][0] != 0 && board[0][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[2][2] != 0 && board[0][0] != 0 && board[0][2] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[2][2] != 0 && board[0][2] != 0 && board[2][0] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            
            if(board[2][0] != 0 && board[0][0] != 0 && board[0][2] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[2][0] != 0 && board[0][0] != 0 && board[2][2] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            if(board[2][0] != 0 && board[0][2] != 0 && board[2][2] != 0){
                posOxHard = 1
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,1
            }
            //End Move center
            
            //Our Corner
            if(board[0][0] == 2){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 && board[0][1] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 && board[1][0] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[0][2] == 2){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 && board[1][2] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 && board[0][1] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[2][2] == 2){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 && board[1][2] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 && board[2][1] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[2][0] == 2){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 && board[1][0] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 && board[2][1] == 0){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            
            //End our corner
            
            // Bug Move
            if(board[0][0] == 2 && board[0][2] == 2 && board[2][1] == 2){
                var bugMove = 0
                
                bugMove = randomNumber(MIN: 1, MAX: 3)
                
                if(bugMove == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }
                if(bugMove == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }
            }
            
            if(board[0][2] == 2 && board[2][2] == 2 && board[1][0] == 2){
                var bugMove = 0
                
                bugMove = randomNumber(MIN: 1, MAX: 3)
                
                if(bugMove == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0 ){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }
                if(bugMove == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0 ){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }
            }
            
            if(board[2][2] == 2 && board[2][0] == 2 && board[0][1] == 2){
                var bugMove = 0
                
                bugMove = randomNumber(MIN: 1, MAX: 3)
                
                if(bugMove == 1){
                    posOxHard = 1
                    posOyHard = 0
                    if(board[posOxHard][posOyHard] == 0 ){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,0
                }
                if(bugMove == 2){
                    posOxHard = 1
                    posOyHard = 2
                    if(board[posOxHard][posOyHard] == 0){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//1,2
                }
            }
            
            if(board[0][0] == 2 && board[2][0] == 2 && board[1][2] == 2){
                var bugMove = 0
                
                bugMove = randomNumber(MIN: 1, MAX: 3)
                
                if(bugMove == 1){
                    posOxHard = 0
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0 ){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//0,1
                }
                if(bugMove == 2){
                    posOxHard = 2
                    posOyHard = 1
                    if(board[posOxHard][posOyHard] == 0 ){
                        board[posOxHard][posOyHard] = 2
                        paintElement(position: posOxHard + (posOyHard * 3))
                        return
                    }//2,1
                }
            }
            // End bug move
            
            //Middle Opposite
            if(board[0][1] == 1 && board[1][1] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[1][2] == 1 && board[1][1] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            if(board[2][1] == 1 && board[1][1] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[1][0] == 1 && board[1][1] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            //End middle opposite
            
            //Middle corner opposite
            if(board[0][1] == 1 && board[2][0] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[0][1] == 1 && board[2][2] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            
            if(board[1][2] == 1 && board[0][0] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            if(board[1][2] == 1 && board[2][0] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            
            if(board[2][1] == 1 && board[0][0] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[2][1] == 1 && board[0][2] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            
            if(board[1][0] == 1 && board[0][2] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[1][0] == 1 && board[2][2] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            //End middle corner opposite
            
            //Middle bug right and left
            if(board[0][0] == 2 && board[2][1] == 2){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            if(board[0][2] == 2 && board[2][1] == 2){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            
            if(board[0][0] == 2 && board[1][2] == 2){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            if(board[2][0] == 2 && board[1][2] == 2){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            
            if(board[0][1] == 2 && board[2][2] == 2){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[0][1] == 2 && board[2][0] == 2){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            
            if(board[1][0] == 2 && board[2][2] == 2){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[1][0] == 2 && board[0][2] == 2){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            //End middle bug top and bot
            
            //Bug Center move
            if(board[1][0] == 1 && board[0][1] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[1][0] == 1 && board[2][1] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            
            if(board[0][1] == 1 && board[1][1] == 1){
                posOxHard = 0
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,0
            }
            if(board[0][1] == 1 && board[1][2] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            
            
            if(board[1][2] == 1 && board[0][1] == 1){
                posOxHard = 0
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,2
            }
            if(board[1][2] == 1 && board[2][1] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            
            if(board[2][1] == 1 && board[1][0] == 1){
                posOxHard = 2
                posOyHard = 0
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,0
            }
            if(board[2][1] == 1 && board[1][2] == 1){
                posOxHard = 2
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//2,2
            }
            //End bug center move
            
            /// O side move
            if(board[0][0] == 1 && board[2][2] == 1){
                posOxHard = 0
                posOyHard = 1
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//0,1
            }
            
            if(board[0][2] == 1 && board[2][0] == 1){
                posOxHard = 1
                posOyHard = 2
                if(board[posOxHard][posOyHard] == 0 ){
                    board[posOxHard][posOyHard] = 2
                    paintElement(position: posOxHard + (posOyHard * 3))
                    return
                }//1,2
            }
            // End O side move
        }//END gameState == 2
    }//End func
    
    func blinkAnimation() -> SKAction{
        let duration = 0.2
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: TimeInterval(duration))
        let fadeIn = SKAction.fadeAlpha(to: 2.0, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        vul = false
        return SKAction.repeat(blink, count: 8)
        
    }
    
    func showWinnerX(firstPos: Int, secondPos: Int,thirdPos:Int){
        xOne = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.xform.name!)
        xOne.position = placeholder[firstPos].position
        xOne.size =  aiHardGameScene.aiHardGameControls.xform.size
        xOne.alpha = 0.725
        xOne.zPosition = 5
        aiHardGameScene.addChild(xOne)
        
        xTwo = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.xform.name!)
        xTwo.position = placeholder[secondPos].position
        xTwo.size =  aiHardGameScene.aiHardGameControls.xform.size
        xTwo.alpha = 0.725
        xTwo.zPosition = 5
        aiHardGameScene.addChild(xTwo)
        
        xThree = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.xform.name!)
        xThree.position = placeholder[thirdPos].position
        xThree.size =  aiHardGameScene.aiHardGameControls.xform.size
        xThree.alpha = 0.725
        xThree.zPosition = 5
        aiHardGameScene.addChild(xThree)
        
        xOne.run(blinkAnimation())
        xTwo.run(blinkAnimation())
        xThree.run(blinkAnimation())
    }
    
    func showWinnerO(firstPos: Int, secondPos: Int,thirdPos:Int){
        oOne = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.oform.name!)
        oOne.position = placeholder[firstPos].position
        oOne.size =  aiHardGameScene.aiHardGameControls.oform.size
        oOne.alpha = 0.725
        oOne.zPosition = 5
        aiHardGameScene.addChild(oOne)
        
        oTwo = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.oform.name!)
        oTwo.position = placeholder[secondPos].position
        oTwo.size =  aiHardGameScene.aiHardGameControls.oform.size
        oTwo.alpha = 0.725
        oTwo.zPosition = 5
        aiHardGameScene.addChild(oTwo)
        
        oThree = SKSpriteNode.init(imageNamed: aiHardGameScene.aiHardGameControls.oform.name!)
        oThree.position = placeholder[thirdPos].position
        oThree.size =  aiHardGameScene.aiHardGameControls.oform.size
        oThree.alpha = 0.725
        oThree.zPosition = 5
        aiHardGameScene.addChild(oThree)
        
        oOne.run(blinkAnimation())
        oTwo.run(blinkAnimation())
        oThree.run(blinkAnimation())
        
    }
    
    func resetNet(){
        for j in 0...(elementSprite.endIndex - 1){
            elementSprite[j].removeFromParent()
        }
    }
    
    func resetGame(){
       self.aiHardGameScene.isUserInteractionEnabled = true
        aiHardGameScene.redEmitter.run(SKAction.sequence([aiHardGameScene.moveEmitter(),SKAction.wait(forDuration: 0.0)]))
        aiHardGameScene.gameViewController.skView.presentScene(aiHardGameScene)
    }
    
    // 0 = play, 1 = winX, 2 = winO, 3 = tie
    func checkPlayWinTie() -> Int {
        
        // Check for X Win
        
        //horizontal top
        if (board[0][0]==1 && board[0][1]==1 && board[0][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 3, thirdPos: 6)
            
            
            ;return 1 }
        // horizontal mid
        if (board[1][0]==1 && board[1][1]==1 && board[1][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 1, secondPos: 4, thirdPos: 7)
            
            ;return 1 }
        // horizontal bottom
        if (board[2][0]==1 && board[2][1]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 2, secondPos: 5, thirdPos: 8)
            
            ;return 1 }
        // vertical left
        if (board[0][0]==1 && board[1][0]==1 && board[2][0]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 1, thirdPos: 2)
            
            ;return 1 }
        // vertical mid
        if (board[0][1]==1 && board[1][1]==1 && board[2][1]==1) {
            
            resetNet()
            showWinnerX(firstPos: 3, secondPos: 4, thirdPos: 5)
            
            ;return 1 }
        // vertical right
        if (board[0][2]==1 && board[1][2]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 6, secondPos: 7, thirdPos: 8)
            
            ;return 1 }
        //inverted diagonal
        if (board[0][0]==1 && board[1][1]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 4, thirdPos: 8)
            
            ;return 1 }
        // diagonal
        if (board[2][0]==1 && board[1][1]==1 && board[0][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 2, secondPos: 4, thirdPos: 6)
            
            ; return 1 }
        // Check for O Win
        if (board[0][0]==2 && board[0][1]==2 && board[0][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 3, thirdPos: 6)
            
            ;return 2 }
        if (board[1][0]==2 && board[1][1]==2 && board[1][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 1, secondPos: 4, thirdPos: 7)
            
            ;return 2 }
        if (board[2][0]==2 && board[2][1]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 2, secondPos: 5, thirdPos: 8)
            
            ;return 2 }
        if (board[0][0]==2 && board[1][0]==2 && board[2][0]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 1, thirdPos: 2)
            
            ;return 2 }
        if (board[0][1]==2 && board[1][1]==2 && board[2][1]==2) {
            
            resetNet()
            showWinnerO(firstPos: 3, secondPos: 4, thirdPos: 5)
            
            ;return 2 }
        if (board[0][2]==2 && board[1][2]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 6, secondPos: 7, thirdPos: 8)
            
            ; return 2 }
        if (board[0][0]==2 && board[1][1]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 4, thirdPos: 8)
            
            ;return 2 }
        if (board[2][0]==2 && board[1][1]==2 && board[0][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 2, secondPos: 4, thirdPos: 6)
            
            ;return 2 }
        
        // Check that is not a Tie
        for posX in 0...2 {
            for posY in 0...2 {
                if board[posX][posY] == 0 {
                    return 0
                }
            }
        }
        
        // Is a Tie
        return 3
    }
    
    // 1= playX, 2= playO, 3= winX, 4= winO, 5= tie, 0= error
    func gameStateMachine(lastState: Int) -> Int {
        
        if (lastState == 1 && checkPlayWinTie() == 0) {
            aiHardGameScene.isUserInteractionEnabled = false
            aiHardGameScene.run(xPlaceSound)
            return 2 // Play X
        }
        /// Player X turn
        if (lastState == 1 && checkPlayWinTie() == 1) {
            aiHardGameScene.run(winSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 3 // Win X
        }
        if (lastState == 1 && checkPlayWinTie() == 3) {
            aiHardGameScene.run(tieSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 5 // Tie
        }
        /// Player O turn
        if (lastState == 2 && checkPlayWinTie() == 0) {
            aiHardGameScene.isUserInteractionEnabled = true
            aiHardGameScene.run(oPlaceSound)
            return 1 // Play O
        }
        if (lastState == 2 && checkPlayWinTie() == 2) {
            aiHardGameScene.run(loseSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 3 // Win O
        }
        if (lastState == 2 && checkPlayWinTie() == 3) {
            aiHardGameScene.run(tieSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 5 // Tie
        }
        return    0
    }
}

