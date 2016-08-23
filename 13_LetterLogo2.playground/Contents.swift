//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import GameKit

let view = UIView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
view.backgroundColor = .black
PlaygroundPage.current.liveView = view

func getSingleCharacterLayer(c: Character, font: UIFont) -> CATextLayer {
	let layer = CATextLayer()
	layer.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
	layer.font = font
	layer.fontSize = 12 // does not use font's size...
	layer.string = String(c)
	return layer
}

let random = GKMersenneTwisterRandomSource()
let colors: [UIColor] = [
	#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
]

func getRandomCharacterLayer(s: String, font: UIFont) -> CATextLayer {
	let randomIndex = random.nextInt(upperBound: s.characters.count)
	let character = s.characters[s.index(s.startIndex, offsetBy: randomIndex)]
	let layer = getSingleCharacterLayer(c: character, font: font)
	layer.foregroundColor = colors[random.nextInt(upperBound: colors.count)].cgColor
	return layer
}

let characterSet = "!@#$%^&*()-=+{}[]|\\;:<>?/~`\""

var height:CGFloat = 0
let font = UIFont(name: "Menlo", size: 32)
repeat {
	var width: CGFloat = 0
	repeat {
		let charLayer = getRandomCharacterLayer(s: characterSet, font: font!)
		charLayer.frame = CGRect(x: width, y: height, width: 8, height: 12)
		view.layer.addSublayer(charLayer)
		
		width += 10.0
	} while (width < view.frame.width)
	height += 18.0
} while (height < view.frame.height)

let maskLayer = CALayer()
maskLayer.frame = view.frame
maskLayer.backgroundColor = UIColor.clear.cgColor

let letterLayer = CATextLayer()
letterLayer.frame = maskLayer.frame
letterLayer.fontSize = 200

letterLayer.alignmentMode = kCAAlignmentCenter
letterLayer.string = "❤️"
maskLayer.addSublayer(letterLayer)

view.layer.mask = maskLayer




let imageRenderer = UIGraphicsImageRenderer(bounds: view.frame)
let jpeg = imageRenderer.jpegData(withCompressionQuality: 1.0) { (context) in
	view.layer.render(in: context.cgContext)
}
// must create '~/Documents/Shared Playground Data' manually
let URL = playgroundSharedDataDirectory.appendingPathComponent("file.jpeg")
print(URL)

try! jpeg.write(to: URL)
print("done")
