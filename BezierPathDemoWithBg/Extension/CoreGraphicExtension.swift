//
//  CoreGraphicExtension.swift
//  BezierPathDemoWithBg
//
//  Created by HP on 7/2/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

extension CGPoint {
    func distance(toPoint p:CGPoint) -> CGFloat {
        return sqrt(pow(x - p.x, 2) + pow(y - p.y, 2))
    }
}
