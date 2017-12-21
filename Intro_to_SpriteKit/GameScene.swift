//
//  GameScene.swift
//  Intro_to_SpriteKit
//
//  Created by Gordon, Russell on 2017-12-19.
//  Copyright © 2017 Gordon, Russell. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    // This method runs once after the scene loads
    override func didMove(to view: SKView) {

        // Set the background color
        backgroundColor = SKColor.black
        
        // Set the midpoint value
        let midPoint = CGPoint(x: size.width / 2.0, y: size.height / 2.0)

        // Add the nyan cat
        let nyanCat = SKSpriteNode(imageNamed: "Nyancat")
        nyanCat.position = midPoint

        // Define a series of animations (bounce up and down)
        let actionMoveUp = SKAction.moveBy(x: 0, y: 10, duration: 1)//0.15)
        let actionMoveDown = SKAction.moveBy(x: 0, y: -10, duration: 1)//0.15)
        let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown])
        let actionRepeat = SKAction.repeatForever(actionSequence)

        // Attach the bounce up and down actions to the cat
        nyanCat.run(actionRepeat)
        
        // Ensure the sprite ends up in a layer above the background node
        nyanCat.zPosition = 10
        
        // Add the cat to the scene
        self.addChild(nyanCat)
        
        // Get a starfield and add to scene
        let stars = StarField(within: self.frame)
        self.addChild(stars)
        
        // Add the rainbow stream (it automatically adds itself to the scene)
        let _ = RainbowStream(on: self, target: nyanCat)
        
        // Make nyan cat happy – play music forever!
        let backgroundMusic = SKAudioNode(fileNamed: "nyan-cat-tune.mp3")
        self.addChild(backgroundMusic)

    }
    
    func touchDown(atPoint pos : CGPoint) {
        print("Touch down at x:\(pos.x) and y:\(pos.y)")
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            print("Space bar pressed")
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
