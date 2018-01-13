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

        let temmie = SKSpriteNode(imageNamed: "temmie")
        temmie.position = midPoint
        temmie.setScale(0.8)
        
        let temmieface = SKSpriteNode(imageNamed: "temmie_face")
        temmieface.position = midPoint
        temmieface.setScale(0.8)
        
        let actionMoveUp = SKAction.moveBy(x: 0, y: 10, duration: 0.05)
        let actionMoveDown = SKAction.moveBy(x: 0, y: -10, duration: 0.05)
        let actionMoveLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.05)
        let actionMoveRight = SKAction.moveBy(x: 10, y: 0, duration: 0.05)
        
        let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown,actionMoveLeft,actionMoveRight])
        let actionRepeat = SKAction.repeatForever(actionSequence)
        temmie.run(actionRepeat)
        temmie.zPosition = 10  // Ensure sprite is above background
        self.addChild(temmie) // Add to the scene
        
        let actionSequence2 = SKAction.sequence([actionMoveDown, actionMoveUp,actionMoveRight, actionMoveLeft])
        let actionRepeat2 = SKAction.repeatForever(actionSequence2)
        temmieface.run(actionRepeat2)
        temmieface.zPosition = 11
        self.addChild(temmieface)
        
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
