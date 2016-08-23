//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
PlaygroundPage.current.liveView = view

let iconLayer = CATextLayer()
iconLayer.alignmentMode = kCAAlignmentCenter
iconLayer.frame = view.frame.insetBy(dx: 160, dy: 160)
iconLayer.fontSize = 60
iconLayer.string = "🎸"
iconLayer.backgroundColor = UIColor.lightGray.cgColor
iconLayer.cornerRadius = 15
view.layer.addSublayer(iconLayer)

let animation = CABasicAnimation(keyPath: "transform")
animation.duration = 0.1
animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
animation.fromValue = NSValue(caTransform3D:CATransform3DMakeRotation(
	-CGFloat.pi * 0.01, 0, 0, 1))
animation.toValue = NSValue(caTransform3D:CATransform3DMakeRotation(
	CGFloat.pi * 0.01, 0, 0, 1))
animation.autoreverses = true
animation.repeatCount = HUGE

iconLayer.add(animation, forKey: nil)

