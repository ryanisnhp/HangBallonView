//
//  PinkViewVersionCurved.swift
//  BezierPathDemoWithBg
//
//  Created by HP on 6/27/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

class PinkCurvedView: UIView{
    let DEFAULT_PADDING : CGFloat = 8.0
    let DEFAULT_BORDER_WIDTH : CGFloat = 8.0
    let DEFAULT_LEAN_HEIGHT : CGFloat = 50.0
    let DEFAULT_CIRCLE_PORTITION : CGFloat = 0.2
    
    var bottomY : CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    var circleRadiusPortition : CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var lean: CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var centerImage : UIImage?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var imagePadding: CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var imageBorderWidth: CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var imageBorderColor: UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var frameBorderColor: UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var frameFillColor: UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var radiusImage: CGFloat?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    lazy var centerImageView = UIImageView()
    
    func dropTheme(theme: CurvedColorTheme){
        self.imageBorderWidth = theme.imageBorderWidth
        self.imageBorderColor = theme.imageBorderColor
        self.frameBorderColor = theme.frameBorderColor
        self.frameFillColor = theme.frameFillColor
        self.backgroundColor = theme.backgroundColor
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let bottomYCoor = bottomY ?? rect.maxY * 0.15
        let radiusCirclePortition = circleRadiusPortition ??  DEFAULT_CIRCLE_PORTITION
        
        if bottomYCoor < 0.0 || radiusCirclePortition >= 0.5{
            debugPrint("Oops, your view is out of range")
            debugPrint("Oops, we can draw the circle with this setting")
        }else{
            let path = UIBezierPath()
            let leanHeight = lean ?? DEFAULT_LEAN_HEIGHT
            
            //MARK: DRAW THE LEFT SIDE OF THE VIEW
            let startPoint = CGPoint(x: 0, y: bottomYCoor)
            path.move(to: startPoint)
            let leftCurvedPointXPortition = (1.0 - 2 * radiusCirclePortition) / 2
            let leftCurvedPoint = CGPoint(x: rect.maxX * leftCurvedPointXPortition, y: bottomYCoor)
            let leftEndPoint = CGPoint(x: rect.maxX * leftCurvedPointXPortition, y: bottomYCoor + leanHeight)
            path.addQuadCurve(to: leftEndPoint, controlPoint: leftCurvedPoint)
            
            //MARK: DRAW THE MIDDLE OF THE VIEW
            let centerPoint = CGPoint(x: rect.midX, y: bottomYCoor + leanHeight)
            let radius = centerPoint.distance(toPoint: leftEndPoint)
            radiusImage = radius
            path.addArc(withCenter: centerPoint, radius: radius, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: false)
            
            //MARK: DRAW THE RIGHT SIDE OF THE VIEW
            let rightCurvedPoint = CGPoint(x: rect.maxX * (1.0 - leftCurvedPointXPortition), y: bottomYCoor)
            let rightEndPoint = CGPoint(x: rect.maxX, y: bottomYCoor)
            path.addQuadCurve(to: rightEndPoint, controlPoint: rightCurvedPoint)
            
            // MARK: CLOSE VIEW
            let topRightPoint = CGPoint(x: rect.maxX, y: 0.0)
            let topLeftPoint = CGPoint(x: 0.0, y: 0.0)
            path.addLine(to: topRightPoint)
            path.addLine(to: topLeftPoint)
            path.close()
            
            // MARK: SRTART DRAWING IMAGE VIEW
            let padding = imagePadding ?? DEFAULT_PADDING
            if padding > radius{ // invalid case
                imagePadding = 0.0
                debugPrint("Image padding is too large, auto set it to 0.0 (no padding)")
            }
            centerImageView.removeFromSuperview()
            let circleImageViewWidth = (radiusCirclePortition * rect.maxX - padding) * 2
            let circleImageFrame = CGRect(x: rect.midX - circleImageViewWidth  / 2, y: bottomYCoor + leanHeight - circleImageViewWidth / 2, width: circleImageViewWidth, height: circleImageViewWidth)
            centerImageView = UIImageView(frame: circleImageFrame)
            centerImageView.layer.masksToBounds = true
            centerImageView.layer.cornerRadius = circleImageViewWidth * 0.5
            if let imageBorderWidth = imageBorderWidth, let imageBorderColor = imageBorderColor{
                centerImageView.layer.borderWidth = imageBorderWidth
                centerImageView.layer.borderColor = imageBorderColor.cgColor
            }
            centerImageView.image = centerImage
            centerImageView.contentMode = .scaleAspectFill
            self.addSubview(centerImageView)
            
            let borderColor = frameBorderColor ?? UIColor.white
            borderColor.setStroke()
            path.lineWidth = DEFAULT_BORDER_WIDTH
            path.stroke()

            let fillColor = frameFillColor ?? UIColor.white
            fillColor.setFill()
            path.fill()
        }
    }
}
