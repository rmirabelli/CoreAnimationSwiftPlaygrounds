//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
PlaygroundPage.current.liveView = view

func path(from: String) -> UIBezierPath? {
	var unichars = [UniChar](from.utf16)
	var glyphs = [CGGlyph](repeating: 0, count: unichars.count)
	let font = UIFont(name: "Menlo", size: 100)!
	let success = CTFontGetGlyphsForCharacters(font, &unichars, &glyphs, unichars.count)
	if success {
		return UIBezierPath(cgPath: CTFontCreatePathForGlyph(font, glyphs.first!, nil)!)
	}
	
	return nil
}

//class AnimationDelegate : NSObject {
//	
//}
//
//extension AnimationDelegate: CAAnimationDelegate {
//	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//		print("done")
//	}
//}
//
//let delegate = AnimationDelegate()

let layer = CAShapeLayer()
layer.frame = view.layer.frame.insetBy(dx: 50, dy: 50)
view.layer.addSublayer(layer)

let bPath = path(from: "B")?.cgPath

layer.path = bPath
layer.isGeometryFlipped = true

let rPath = path(from: "R")?.cgPath
let animation = CABasicAnimation(keyPath: "path")
animation.duration = 3.0
animation.fromValue = bPath
animation.toValue = rPath
animation.isRemovedOnCompletion = false
layer.add(animation, forKey: nil)
layer.path = rPath // set this immediately after adding animation to make it "stick"


//animation.delegate = delegate
