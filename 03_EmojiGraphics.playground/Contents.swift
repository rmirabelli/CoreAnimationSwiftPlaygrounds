//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = view

let textLayer = CATextLayer()
textLayer.frame = view.frame
textLayer.string = "🎸"
textLayer.fontSize = 300
textLayer.alignmentMode = kCAAlignmentCenter

view.layer.addSublayer(textLayer)


