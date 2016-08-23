//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
PlaygroundPage.current.liveView = view

let guitarLayer = CATextLayer()
guitarLayer.string = "🎸"
guitarLayer.fontSize = 35
guitarLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
guitarLayer.position = CGPoint(x: 75, y: 75)
guitarLayer.cornerRadius = 25

let fadeGuitar = CABasicAnimation(keyPath: "opacity")
fadeGuitar.fromValue = 1.0
fadeGuitar.toValue = 0.0
fadeGuitar.repeatCount = HUGE
fadeGuitar.duration = 1.0
guitarLayer.add(fadeGuitar, forKey: "opacity")

let replication = CAReplicatorLayer()
replication.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
replication.position = view.center
replication.instanceCount = 10
replication.instanceDelay = 0.1
replication.instanceTransform = CATransform3DMakeRotation(CGFloat(M_PI/5), 0, 0, 1)
replication.addSublayer(guitarLayer)
view.layer.addSublayer(replication)
