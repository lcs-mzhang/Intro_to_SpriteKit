//
//  ViewController.swift
//  Intro_to_SpriteKit
//
//  Created by Gordon, Russell on 2017-12-19.
//  Copyright © 2017 Gordon, Russell. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Attempt to get an instance of SKView to present the game scene
        if let view = self.skView {
            
            // Set the size for the scene
            let sceneSize = CGSize(width: 600, height: 600)
            
            // Load the SKScene from the GameScene class
            let scene = GameScene(size: sceneSize)
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            // Make node rendering arbirtrary (increases performance)
            view.ignoresSiblingOrder = true
            
            // Show the frames per second indicator
            view.showsFPS = true
            
            // Show the scene node count indicator
            view.showsNodeCount = true
            
        }
    }
}

