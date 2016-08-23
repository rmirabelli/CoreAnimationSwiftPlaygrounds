//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
PlaygroundPage.current.liveView = view

let textLayer = CATextLayer()
textLayer.string = "🐠"
textLayer.fontSize = 100
textLayer.frame = view.frame
textLayer.alignmentMode = kCAAlignmentCenter
view.layer.addSublayer(textLayer)

let rotationInDegrees = Measurement(value: 45, unit: UnitAngle.degrees)
let rotationInRadians = CGFloat(rotationInDegrees.converted(to: .radians).value)
let transform = CATransform3DMakeRotation(rotationInRadians, 0, 0.0, 1.0)
textLayer.transform = transform

let animation = CABasicAnimation(keyPath: "transform")
animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: 10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: -10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
animation.duration = 2.0
animation.repeatCount = Float.infinity
animation.autoreverses = true
textLayer.add(animation, forKey: nil)

////let timingFunction = CAMediaTimingFunction(controlPoints: 0.08, 0.04, 0.08, 0.99)
////
////animation.timingFunction = timingFunction


let position = CABasicAnimation(keyPath: "position.x")
position.fromValue = view.frame.width
position.toValue = 0
position.duration = 10.0
position.repeatCount = Float.infinity

textLayer.add(position, forKey: nil)
