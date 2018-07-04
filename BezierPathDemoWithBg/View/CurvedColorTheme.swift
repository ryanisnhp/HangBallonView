//
//  CurvedColorTheme.swift
//  BezierPathDemoWithBg
//
//  Created by HP on 6/28/18.
//  Copyright © 2018 rth. All rights reserved.
//
import UIKit
struct CurvedColorTheme{
    let imageBorderWidth: CGFloat?
    let imageBorderColor: UIColor?
    let frameBorderColor : UIColor?
    let frameFillColor : UIColor?
    let backgroundColor: UIColor?
    
    init(imageBorderWidth: CGFloat?, imageBorderColor: UIColor?, frameBorderColor: UIColor?, frameFillColor: UIColor?, backgroundColor: UIColor?) {
        self.imageBorderWidth = imageBorderWidth
        self.imageBorderColor = imageBorderColor
        self.frameBorderColor = frameBorderColor
        self.frameFillColor = frameFillColor
        self.backgroundColor = backgroundColor
    }
}
