//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
PlaygroundPage.current.liveView = view



let layer = CATextLayer()
layer.backgroundColor = UIColor.white.cgColor
layer.cornerRadius = 10
layer.frame = view.frame.insetBy(dx: 100, dy: 100)
layer.string = "🐰"
layer.fontSize = 148
layer.alignmentMode = kCAAlignmentCenter
layer.foregroundColor = UIColor.red.cgColor

view.layer.addSublayer(layer)


let animation = CABasicAnimation(keyPath: "transform")
animation.duration = 5.0
animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(-CGFloat.pi, 0, 1, 0))
animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(0.0, 0, 1, 0))
animation.repeatCount = Float.infinity
layer.add(animation, forKey: nil)

var transform = CATransform3DIdentity
transform.m34 = -1.0/500.0
view.layer.sublayerTransform = transform
