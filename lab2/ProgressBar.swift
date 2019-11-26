//
//  ProgressBar.swift
//  lab2
//
//  Created by Vivien Geschwind on 26.11.19.
//  Copyright © 2019 Vivien Geschwind. All rights reserved.
//

import Foundation
import UIKit


class ProgressBar: UIView {

  @IBInspectable public var backGroundCircleColor: UIColor = UIColor.lightGray
  @IBInspectable public var startGradientColor: UIColor = UIColor(red: 55/255.0, green: 192/255.0, blue: 170/255.0, alpha: 1)
  @IBInspectable public var endGradientColor: UIColor = UIColor(red: 236/255.0, green: 227/255.0, blue: 91/255.0, alpha: 1)
  @IBInspectable public var textColor: UIColor = UIColor.black


    var backgroundLayer = CAShapeLayer()
    var foregroundLayer = CAShapeLayer()
    var textLayer = CATextLayer()
    var gradientLayer = CAGradientLayer()

  public var progress: CGFloat = 0 {
    didSet {
        didProgressUpdated()
    }
  }

  override func draw(_ rect: CGRect) {

    guard layer.sublayers == nil else {
      return
    }

    let width = rect.width
    let height = rect.height

    let lineWidth = 15

    backgroundLayer = createCircularLayer(rect: rect, strokeColor: backGroundCircleColor.cgColor, fillColor: UIColor(red: 236/255.0, green: 227/255.0, blue: 91/255.0, alpha: 0.6).cgColor, lineWidth: CGFloat(lineWidth))

    foregroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))

    gradientLayer = CAGradientLayer()
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

    gradientLayer.colors = [startGradientColor.cgColor, endGradientColor.cgColor]
    gradientLayer.frame = rect
    gradientLayer.mask = foregroundLayer

    textLayer = createTextLayer(rect: rect, textColor: textColor.cgColor)
    
    layer.addSublayer(backgroundLayer)
    layer.addSublayer(gradientLayer)
    layer.addSublayer(textLayer)
  }

  private func createCircularLayer(rect: CGRect, strokeColor: CGColor,
                                   fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {

    let width = rect.width
    let height = rect.height

    let center = CGPoint(x: width / 2, y: height / 2)
    let radius = (min(width, height) - lineWidth) / 2

    let startAngle = -CGFloat.pi / 2
    let endAngle = startAngle + 2 * CGFloat.pi

    let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

    let shapeLayer = CAShapeLayer()

    shapeLayer.path = circularPath.cgPath
    shapeLayer.strokeColor = strokeColor
    shapeLayer.fillColor = fillColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.lineCap = .round

    return shapeLayer
  }

  private func createTextLayer(rect: CGRect, textColor: CGColor) -> CATextLayer {

    let width = rect.width
    let height = rect.height

    let fontSize = min(width, height) / 6

    let layer = CATextLayer()
    layer.string = "\(Int(progress * 100))"
    layer.backgroundColor = UIColor.clear.cgColor
    layer.foregroundColor = textColor
    layer.fontSize = fontSize
    layer.frame = CGRect(x: 0, y: (height - fontSize ) / 2, width: width, height: fontSize )
    layer.alignmentMode = .center

    return layer
  }

  private func didProgressUpdated() {
    textLayer.string = "\(Int(progress * 100))%"
    foregroundLayer.strokeEnd = progress
    
    if (Int(progress)*100 == 100) {
    
    textLayer.string = "completed"
    textLayer.fontSize = 30
        
        
  }
 }
}
