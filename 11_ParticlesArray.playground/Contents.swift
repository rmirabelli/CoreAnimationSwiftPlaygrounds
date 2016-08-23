//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
PlaygroundPage.current.liveView = view

func createCell(string: String) -> CAEmitterCell {
	let icon = CATextLayer()
	icon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
	icon.fontSize = 30
	icon.string = string
	
	// new for iOS 10
	let renderer = UIGraphicsImageRenderer.init(bounds: icon.frame)
	let image = renderer.image { (context) in
		icon.render(in: context.cgContext)
	}
	let cell = CAEmitterCell()
	cell.contents = image.cgImage
	cell.birthRate = 0.5
	cell.speed = 10.0
	cell.lifetime = 15
	
	cell.velocity = 3.0
	cell.yAcceleration = 3.3
	cell.xAcceleration = 3.3
	cell.scale = 1.0
	cell.scaleRange = 1.0
	cell.scaleSpeed = 0.5
	cell.lifetimeRange = 10
	cell.spin = 1.0
	cell.spinRange = 10.0
	cell.alphaSpeed = -0.9
	
	return cell
}

func createCellArray(string: String) -> [CAEmitterCell] {
	return string.characters.map() { createCell(string: String($0)) }
}

let emitter = CAEmitterLayer()
emitter.frame = view.frame
view.layer.addSublayer(emitter)

//emitter.emitterCells = [createCell(string: "❤️"),createCell(string: "💛"),createCell(string: "💚"),createCell(string: "💙"),createCell(string: "💜")]

emitter.emitterCells = createCellArray(string: "❤️💛💚💙💜💕💞💗")

emitter.emitterPosition = CGPoint(x: 200, y: 200)
emitter.emitterShape = kCAEmitterLayerSphere
emitter.emitterSize = CGSize(width: 400, height: 400)
emitter.renderMode = kCAEmitterLayerOldestFirst

