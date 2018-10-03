//
//  AiEasyGame.swift
//  TicTacToe
//
//  Created by María del Pilar López Pacheco on 8/10/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import Firebase
class AiEasyGame {
    
    /// Game Scene
    let aiEasyScene: AiEasyScene!
    
    /// Game Controls
    var aiEasyControls: AiEasyControls!
    
    /// Arrays of Sprites
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
    
    var gameState : Int
    var board : [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
    
    /// Sounds
    let xPlaceSound = SKAction.playSoundFileNamed("Xsound", waitForCompletion: false)
    let oPlaceSound = SKAction.playSoundFileNamed("Osound", waitForCompletion: false)
    let winSound = SKAction.playSoundFileNamed("WinXO", waitForCompletion: false)
    let loseSound = SKAction.playSoundFileNamed("LoseXO", waitForCompletion: false)
    let tieSound = SKAction.playSoundFileNamed("TieXO", waitForCompletion: false)
    
    /// Time Var and Let
    var seconds: Int = 0
    
    init(inThisScene: AiEasyScene) {
        
        aiEasyScene = inThisScene
        
        self.aiEasyScene.isUserInteractionEnabled = true
        
        /// Painting placeholders
        
        for x in -1...1 {
            for y in -1...1 {

                
                if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
                    
                    placeholder.append(SKShapeNode(rectOf: aiEasyScene.aiEasyControls.oform.size))
                    let valX = (aiEasyScene.size.width/2) + ((inThisScene.size.width/3.6) * CGFloat( x) )
                    let valY = (aiEasyScene.size.height*4.75/10) - ((inThisScene.size.height/6.4) * CGFloat( y) )
                    
                    placeholder[i].position = CGPoint(x: valX, y: valY)
                    placeholder[i].fillColor = .clear
                    placeholder[i].strokeColor = .clear
                    placeholder[i].zPosition = 4
                    placeholder[i].name = "Position \(i)"
                    
                    i += 1
                    
                }else{
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        // TODO: Works with iPhone 6, needs to be resized to other formats
                        placeholder.append(SKShapeNode(rectOf: aiEasyScene.aiEasyControls.oform.size))
                        let valX = (aiEasyScene.size.width/2) + ((inThisScene.size.width/4.5) * CGFloat( x) )
                        let valY = (aiEasyScene.size.height*5/10) - ((inThisScene.size.height/6.18) * CGFloat( y) )
                        
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
        elementSprite.last?.size = aiEasyScene.aiEasyControls.oform.size
        elementSprite.last!.zPosition = 5
        aiEasyScene.addChild(elementSprite.last!)
        
        // Set gameState
        gameState = gameStateMachine(lastState: gameState)
    }
    
    func inputValue(posX: Int, posY: Int, value: Int) -> Bool {
        if ( board[posX][posY] == 0 ){
            if(gameState == 1){
                board[posX][posY] = value
                paintElement(position: posX + (posY * 3))
            }
            if(gameState == 2){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.moveAI()
                }
            }
            
            return true
        }
        else {
            return false
        }
    }
    
    func moveAI(){
        var posOx = 0
        var posOy = 0
        
        posOx = randomNumber(MIN: 0, MAX: 3)
        posOy = randomNumber(MIN: 0, MAX: 3)
        
        if(board[posOx][posOy] == 0 ){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.board[posOx][posOy] = 2
                self.paintElement(position: posOx + (posOy * 3))
                print(posOx)
                print(posOy)
            }
        }else{
            moveAI()
        }
        
    }
    func blinkAnimation() -> SKAction{
        let duration = 0.2
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: TimeInterval(duration))
        let fadeIn = SKAction.fadeAlpha(to: 2.0, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        vul = false
        return SKAction.repeat(blink, count: 8)
        
    }
    
    func showWinnerX(firstPos: Int, secondPos: Int,thirdPos:Int){
        xOne = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.xform.name!)
        xOne.position = placeholder[firstPos].position
        xOne.size =  aiEasyScene.aiEasyControls.xform.size
        xOne.alpha = 0.725
        xOne.zPosition = 5
        aiEasyScene.addChild(xOne)
        
        xTwo = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.xform.name!)
        xTwo.position = placeholder[secondPos].position
        xTwo.size =  aiEasyScene.aiEasyControls.xform.size
        xTwo.alpha = 0.725
        xTwo.zPosition = 5
        aiEasyScene.addChild(xTwo)
        
        xThree = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.xform.name!)
        xThree.position = placeholder[thirdPos].position
        xThree.size =  aiEasyScene.aiEasyControls.xform.size
        xThree.alpha = 0.725
        xThree.zPosition = 5
        aiEasyScene.addChild(xThree)
        
        xOne.run(blinkAnimation())
        xTwo.run(blinkAnimation())
        xThree.run(blinkAnimation())
    }
    
    func showWinnerO(firstPos: Int, secondPos: Int,thirdPos:Int){
        oOne = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.oform.name!)
        oOne.position = placeholder[firstPos].position
        oOne.size =  aiEasyScene.aiEasyControls.oform.size
        oOne.alpha = 0.725
        oOne.zPosition = 5
        aiEasyScene.addChild(oOne)
        
        oTwo = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.oform.name!)
        oTwo.position = placeholder[secondPos].position
        oTwo.size =  aiEasyScene.aiEasyControls.oform.size
        oTwo.alpha = 0.725
        oTwo.zPosition = 5
        aiEasyScene.addChild(oTwo)
        
        oThree = SKSpriteNode.init(imageNamed: aiEasyScene.aiEasyControls.oform.name!)
        oThree.position = placeholder[thirdPos].position
        oThree.size =  aiEasyScene.aiEasyControls.oform.size
        oThree.alpha = 0.725
        oThree.zPosition = 5
        aiEasyScene.addChild(oThree)
        
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
         Analytics.logEvent("ResetGame", parameters: nil)
        self.aiEasyScene.isUserInteractionEnabled = true
        aiEasyScene.gameViewController.skView.presentScene(aiEasyScene)
    }
    
    // 0 = play, 1 = winX, 2 = winO, 3 = tie
    func checkPlayWinTie() -> Int {
        
        // --*Check for X Win*--
        // Horizontal Top
        if (board[0][0]==1 && board[0][1]==1 && board[0][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 3, thirdPos: 6); return 1 }
        
        // Horizontal Middle
        if (board[1][0]==1 && board[1][1]==1 && board[1][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 1, secondPos: 4, thirdPos: 7); return 1 }
        
        // Horizontal Bottom
        if (board[2][0]==1 && board[2][1]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 2, secondPos: 5, thirdPos: 8); return 1 }
        
        // Vertical Left
        if (board[0][0]==1 && board[1][0]==1 && board[2][0]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 1, thirdPos: 2); return 1 }
        
        // Vertical Middle
        if (board[0][1]==1 && board[1][1]==1 && board[2][1]==1) {
            
            resetNet()
            showWinnerX(firstPos: 3, secondPos: 4, thirdPos: 5); return 1 }
        
        // Vertical Right
        if (board[0][2]==1 && board[1][2]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 6, secondPos: 7, thirdPos: 8); return 1 }
        
        // Inverted Diagonal \
        if (board[0][0]==1 && board[1][1]==1 && board[2][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 0, secondPos: 4, thirdPos: 8); return 1 }
        
        // Diagonal /
        if (board[2][0]==1 && board[1][1]==1 && board[0][2]==1) {
            
            resetNet()
            showWinnerX(firstPos: 2, secondPos: 4, thirdPos: 6); return 1 }
        
        // --*Check for O Win*--
        // Horizontal Top
        if (board[0][0]==2 && board[0][1]==2 && board[0][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 3, thirdPos: 6); return 2 }
        
        // Horizontal Middle
        if (board[1][0]==2 && board[1][1]==2 && board[1][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 1, secondPos: 4, thirdPos: 7); return 2 }
        
        // Horizontal Bottom
        if (board[2][0]==2 && board[2][1]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 2, secondPos: 5, thirdPos: 8); return 2 }
        
        // Vertical Left
        if (board[0][0]==2 && board[1][0]==2 && board[2][0]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 1, thirdPos: 2); return 2 }
        
        // Vertical Middle
        if (board[0][1]==2 && board[1][1]==2 && board[2][1]==2) {
            
            resetNet()
            showWinnerO(firstPos: 3, secondPos: 4, thirdPos: 5); return 2 }
        
        // Vertical Right
        if (board[0][2]==2 && board[1][2]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 6, secondPos: 7, thirdPos: 8); return 2 }
        
        // Inverted Diagonal \
        if (board[0][0]==2 && board[1][1]==2 && board[2][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 0, secondPos: 4, thirdPos: 8); return 2 }
        
        // Diagonal /
        if (board[2][0]==2 && board[1][1]==2 && board[0][2]==2) {
            
            resetNet()
            showWinnerO(firstPos: 2, secondPos: 4, thirdPos: 6); return 2 }
        
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
            aiEasyScene.isUserInteractionEnabled = false
            aiEasyScene.run(xPlaceSound)
            return 2
            // Play Y
        }
        /// Player X turn
        if (lastState == 1 && checkPlayWinTie() == 1) {
            aiEasyScene.isUserInteractionEnabled = false
            aiEasyScene.run(winSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 3 // Win X
        }
        if (lastState == 1 && checkPlayWinTie() == 3) {
            aiEasyScene.isUserInteractionEnabled = false

            aiEasyScene.run(tieSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 5 // Tie
        }
        /// Player O turn
        if (lastState == 2 && checkPlayWinTie() == 0) {
            aiEasyScene.isUserInteractionEnabled = true
            aiEasyScene.run(oPlaceSound)
            return 1 // Play O
        }
        if (lastState == 2 && checkPlayWinTie() == 2) {
            aiEasyScene.isUserInteractionEnabled = false
            aiEasyScene.run(loseSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 3 // Win O
        }
        if (lastState == 2 && checkPlayWinTie() == 3) {
            aiEasyScene.isUserInteractionEnabled = false
            aiEasyScene.run(tieSound)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resetGame()
            }
            return 5 // Tie
        }
        return    0
    }
    
}

