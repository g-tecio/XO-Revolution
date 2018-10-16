//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    /// GameViewControl setup as reference to handle SceneStates
    var gameViewController: GameViewController!
    
    /// Game Controls
    var gameControls: GameControls!
    
    /// Game TicTacToe
    var gameTicTacToe : GameTicTacToe!
    
    var sceneNumber: Int = 2
    
    private var lastUpdateTime : TimeInterval = 0
    
    /// Custom Initializer
    init(sceneSize: CGSize, referenceGVC: GameViewController) {
        
        /// Set reference of GameViewControl
        gameViewController = referenceGVC
        
        /// Create scene from code
        super.init(size: sceneSize)
        
        /// Game Controls and TicTacToe
        gameControls = GameControls.init(inThisScene: self)
        gameTicTacToe = GameTicTacToe.init(inThisScene: self)
        
        /// Load scene
        if let skView = gameViewController.view as! SKView? {
            self.size = skView.bounds.size
            self.scaleMode = .aspectFill
        }
    }
    
    /// Included because is a requisite if a custom Init is used
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Effects
    var initialTime : TimeInterval = 0.0
    var triggerTime : TimeInterval = 0.25
    let blueEmitter = SKEmitterNode(fileNamed: "blueParticle")!
    let redEmitter = SKEmitterNode(fileNamed: "redParticle")!
    let purpleEmitter = SKEmitterNode(fileNamed: "purpleParticle")!
    let orangeEmitter = SKEmitterNode(fileNamed: "orangeParticle")!
    let ghostOrangeEmitter = SKEmitterNode(fileNamed: "ghostParticle")!
    let ghostPurpleEmitter = SKEmitterNode(fileNamed: "batParticle")!
    var randomSource = GKRandomSource.sharedRandom()
    
    /// Present Elements to the Scene
    override func didMove(to view: UIView) {
        
        self.backgroundColor = UIColor.clear
        
        if sceneNumber == 0 {
            
            /// Present Label and Button
            self.addChild(gameControls.buttonMenu)
            self.addChild(gameControls.net)
            
            /// Present effects
            blueEmitter.targetNode = self
            blueEmitter.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            
            redEmitter.targetNode = self
            redEmitter.position = CGPoint(x: self.size.width/1, y: self.size.height/1)
            
            self.addChild(blueEmitter)
            self.addChild(redEmitter)
            
            if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
                
                // iPhone, iPad, iPad2 and iPadMini Particle
                
            }else{
                
                if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                    
                    /// iPad Particle
                    redEmitter.particleScale = 0.4
                    blueEmitter.particleScale = 0.4
                    
                }
            }
            
        }
        
        if(sceneNumber == 1 ){
            
            /// Present Label and Button
            self.addChild(gameControls.octoberButtonMenu)
            self.addChild(gameControls.octoberNet)
            
            /// Present effects
            purpleEmitter.targetNode = self
            purpleEmitter.position = CGPoint(x: self.size.width/1, y: self.size.height/1)
            
            orangeEmitter.targetNode = self
            orangeEmitter.position = CGPoint(x: self.size.width/1, y: self.size.height/1)
            
            self.addChild(purpleEmitter)
            self.addChild(orangeEmitter)
            
            if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
                
                // iPhone, iPad, iPad2 and iPadMini Particle
                
            }else{
                
                if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                    
                    /// iPad Particle
                    purpleEmitter.particleScale = 0.4
                    orangeEmitter.particleScale = 0.4
                    
                }
            }
            
            
        }
        
        if(sceneNumber == 2 ){
            
            /// Present Label and Button
            self.addChild(gameControls.halloweenButtonMenu)
            self.addChild(gameControls.halloweenNet)
            
            /// Present effects
            ghostPurpleEmitter.targetNode = self
            ghostPurpleEmitter.position = CGPoint(x: self.size.width/1, y: self.size.height/1)
            
            ghostOrangeEmitter.targetNode = self
            ghostOrangeEmitter.position = CGPoint(x: self.size.width/1, y: self.size.height/1)
            
            self.addChild(ghostPurpleEmitter)
            self.addChild(ghostOrangeEmitter)
            
            if UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.deviceType == .iPad || UIDevice.current.deviceType == .iPad2 || UIDevice.current.deviceType == .iPadMini {
                
                // iPhone, iPad, iPad2 and iPadMini Particle
                
            }else{
                
                if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.deviceType == .simulator {
                    
                    /// iPad Particle
                    ghostPurpleEmitter.particleScale = 0.4
                    ghostOrangeEmitter.particleScale = 0.4
                    
                }
            }
            
        }
        
        gameTicTacToe.gameState = 1
        gameTicTacToe.board = [[0,0,0],[0,0,0],[0,0,0]]
        
        /// Add Placeholders
        for i in 0...8 {
            gameTicTacToe.placeholder[i].isHidden = false
            self.addChild(gameTicTacToe.placeholder[i])
        }
        
        
    }
    
    /// Before another Scence will be presented
    override func willMove(from view: UIView) {
        removeAllChildren()
    }
    
    /// Touch event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let item = atPoint(location)
            
            /// Exit and return to GameScene
            if (item.name == "buttonSprite-Menu") {
                self.gameViewController.showAds()
                gameViewController.skView.presentScene(gameViewController.menuScene)
            }
            else {
                for i in 0...8 {
                    if gameTicTacToe.placeholder[i] == item {
                        if !(gameTicTacToe.inputValue(posX: i % 3, posY: i / 3, value: gameTicTacToe.gameState)) {
                            print("Invalid position, try again")
                        }
                    }
                }
            }
        }
    }//END touches Began
    
    func randomPositionInScene() -> CGPoint {
        let xPos = randomSource.nextInt(upperBound: Int(self.size.width))
        let yPos = randomSource.nextInt(upperBound: Int(self.size.height))
        return CGPoint(x: xPos, y: yPos)
    }
    
    func moveEmitter() -> SKAction {
        return SKAction.move(to: randomPositionInScene(),duration: 0.4)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if (sceneNumber == 0) {
            if (blueEmitter.hasActions() || redEmitter.hasActions()){
                
            }
            else {
                blueEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
                redEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
            }
        }
        if (sceneNumber == 1) {
            
            if (purpleEmitter.hasActions() || orangeEmitter.hasActions()){
                
            }
            else {
                orangeEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
                purpleEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
            }
        }
        if (sceneNumber == 2) {
            
            if (ghostPurpleEmitter.hasActions() || ghostOrangeEmitter.hasActions()){
                
            }
            else {
                ghostPurpleEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
                ghostOrangeEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
            }
        }
    }
}
