//
//  GameViewController.swift
//  XO-Revolution
//
//  Created by María del Pilar López on 8/27/18.
//  Copyright © 2018 María del Pilar López. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Device_swift

// TODO: Fix this class

class GameViewController: UIViewController {
    
    let skView = SKView()
    let lottieUiView = UIView()
    
    /// Scenes
    var introScene: IntroScene!
    var menuScene: MenuScene!
    var difficultyScene: DifficultyScene!
    var gameScene: GameScene!
    var aiHardScene: AiHardScene!
    var aiEasyScene: AiEasyScene!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            print("iPhone")
            
        }else{
            if UIDevice.current.userInterfaceIdiom == .pad {
            print("iPad")
            }
        }
        
        let deviceType = UIDevice.current.deviceType
        
        print(deviceType)
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        skView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        skView.center = self.view.center
        skView.contentMode = .scaleAspectFill
        skView.allowsTransparency = true
        
        lottieUiView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        lottieUiView.center = self.view.center
        lottieUiView.contentMode = .scaleAspectFill
        lottieUiView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        
        /// Introduction Scene
        introScene = IntroScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Menu Scene
        menuScene = MenuScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Menu Difficulty
        difficultyScene = DifficultyScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// Two Players Game Scene
        gameScene = GameScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Easy Scene
        aiEasyScene = AiEasyScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// AI Hard Scene
        aiHardScene = AiHardScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        skView.presentScene(introScene)
        
        view.addSubview(lottieUiView)
        view.addSubview(skView)
    }
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
