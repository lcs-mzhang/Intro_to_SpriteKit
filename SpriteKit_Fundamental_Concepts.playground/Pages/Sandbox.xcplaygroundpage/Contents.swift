//: [Previous](@previous)
/*:
 # Sandbox
 
 In this sandbox, let's break down what's happening to create this partial animation of the "nyan cat".
 
 Below, we import some required libraries.
 */
import Foundation
import SpriteKit
import PlaygroundSupport

//: Define a frame to draw upon (kind of like creating a canvas from earlier this year).
let frame = CGRect(x: 0, y: 0, width: 320, height: 256)

//: Define the midpoint of the frame
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

//: Create a scene that will render our animation.
//: Notice that the size of the scene is taken from the `frame` defined earlier.
var scene = SKScene(size: frame.size)

//: Create an instance of the SKSpriteNode class using the Nyancat image.
let temmie = SKSpriteNode(imageNamed: "temmie")
temmie.position = midPoint
temmie.setScale(0.45)

let temmieface = SKSpriteNode(imageNamed: "temmie_face")
temmieface.position = midPoint
temmieface.setScale(0.45)

let actionMoveUp = SKAction.moveBy(x: 0, y: 10, duration: 0.05)
let actionMoveDown = SKAction.moveBy(x: 0, y: -10, duration: 0.05)
let actionMoveLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.05)
let actionMoveRight = SKAction.moveBy(x: 10, y: 0, duration: 0.05)

let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown,actionMoveLeft,actionMoveRight])
let actionRepeat = SKAction.repeatForever(actionSequence)
temmie.run(actionRepeat)
temmie.zPosition = 10  // Ensure sprite is above background
scene.addChild(temmie) // Add to the scene

let actionSequence2 = SKAction.sequence([actionMoveDown, actionMoveUp,actionMoveRight, actionMoveLeft])
let actionRepeat2 = SKAction.repeatForever(actionSequence2)
temmieface.run(actionRepeat2)
temmieface.zPosition = 11
scene.addChild(temmieface)
//: Now show the scene within an SKView instance in the live view area
let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

//: [Next](@next)
