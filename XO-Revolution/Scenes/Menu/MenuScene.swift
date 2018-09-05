//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit
import Firebase

class MenuScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
   // let skView = SKView()
	/// Game Controls
	var menuControls: MenuControls!
    
    private var lastUpdateTime : TimeInterval = 0

	/// Custom Initializer
	init(sceneSize: CGSize, referenceGVC: GameViewController) {
		
		/// Set reference of GameViewControl
		gameViewController = referenceGVC
		
		/// Create scene from code
		super.init(size: sceneSize)
		
		/// Menu Controls
        menuControls = MenuControls.init(inThisScene: self)
        
		/// Load scene
		if let skView = gameViewController.view as! SKView? {
			self.size = skView.bounds.size
			self.scaleMode = .aspectFill
            self.backgroundColor = UIColor(red:0.10, green:0.10, blue:0.10, alpha:1.0)

			// TODO: Comment or remove before release to App Store
			skView.ignoresSiblingOrder = true
			skView.showsFPS = true
			skView.showsNodeCount = true
            skView.backgroundColor = UIColor.clear
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
    var randomSource = GKRandomSource.sharedRandom()
	
	/// Present Elements to the Scene
   override func didMove(to view: UIView) {

    self.backgroundColor = UIColor.clear
    
    /// Present Label and Button
    self.addChild(menuControls.buttonOnePlayer)
    self.addChild(menuControls.buttonTwoPlayers)
    
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
			if (item.name == "buttonSprite-Game") {
                    Analytics.logEvent("OnePlayer", parameters: nil)
                gameViewController.skView.presentScene(gameViewController.difficultyScene)
			}
            if (item.name == "buttonSprite-2Players") {
                    Analytics.logEvent("TwoPlayers", parameters: nil)
                gameViewController.skView.presentScene(gameViewController.gameScene)
            }
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
    
    func randomPositionInScene() -> CGPoint {
        let xPos = randomSource.nextInt(upperBound: Int(self.size.width))
        let yPos = randomSource.nextInt(upperBound: Int(self.size.height))
        return CGPoint(x: xPos, y: yPos)
    }
    
    func moveEmitter() -> SKAction {
        return SKAction.move(to: randomPositionInScene(),duration: 0.4)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if (blueEmitter.hasActions() || redEmitter.hasActions()) {
            
        }
        else {
            blueEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
            redEmitter.run(SKAction.sequence([moveEmitter(),SKAction.wait(forDuration: 0.0)]))
        }
    }
}
