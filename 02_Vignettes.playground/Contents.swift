//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
PlaygroundPage.current.liveView = view

let clownfish = #imageLiteral(resourceName: "clownfish.png")

let imageLayer = CALayer()
imageLayer.frame = view.frame
imageLayer.contents = clownfish.cgImage
imageLayer.contentsGravity = kCAGravityCenter

view.layer.addSublayer(imageLayer)

let alpha:CGFloat = 0.9
let colors = [
	UIColor.clear.cgColor,
	UIColor.lightGray.withAlphaComponent(alpha).cgColor,
	UIColor.darkGray.withAlphaComponent(alpha).cgColor,
	UIColor.black.withAlphaComponent(alpha).cgColor
]

let gradient = CAGradientLayer()
gradient.frame = view.frame
gradient.colors = colors
gradient.locations = [0.7,0.9,0.95]

view.layer.addSublayer(gradient)

let textLayer = CATextLayer()
textLayer.frame = view.frame
textLayer.frame.origin.y = 350
textLayer.string = "Jenny Huang"
textLayer.alignmentMode = kCAAlignmentRight

view.layer.addSublayer(textLayer)
