//
//  ViewController.swift
//  BezierPathDemoWithBg
//
//  Created by HP on 6/26/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var srollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    var pinkView = PinkCurvedView()
    
    let palette: [UIColor] = [UIColor(rgb: 0xfbf0f0), UIColor(rgb: 0xdfd3d3), UIColor(rgb: 0xb8b0b0), UIColor(rgb: 0x7c7575)]
    
    let startBottomY : CGFloat = 150.0
    let startLean: CGFloat = 50.0
    var radiusPortition : CGFloat = 0.2
    lazy var topFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        srollView.delegate = self
        topFrame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 300.0)
        pinkView = PinkCurvedView(frame: topFrame)
        let centerImage = UIImage(named: "my_avatar")
        pinkView.bottomY = startBottomY
        pinkView.centerImage = centerImage
        pinkView.backgroundColor = UIColor.clear
        pinkView.imageBorderWidth = 4.0
        pinkView.lean = startLean
        pinkView.circleRadiusPortition = radiusPortition
        pinkView.imageBorderColor = palette[0]
        pinkView.frameFillColor = palette[1]
        pinkView.frameBorderColor = palette[2]
        view.addSubview(pinkView)
        
        //Set up label
        nameLabel.font = UIFont(name: "IndieFlower", size: 34.0)
        nameLabel.textColor = UIColor(rgb: 0x7c7575)
        nameLabel.text = "Phát NH"
    }

    @IBAction func onDoSomething(_ sender: UIButton) {
        debugPrint("Do nothing")
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yCoor = scrollView.contentOffset.y
        if yCoor <= 70.0 && yCoor >= 0.0{
            pinkView.bottomY = startBottomY - yCoor
            pinkView.frame = CGRect(x: 0.0, y: 0.0, width: topFrame.width, height: topFrame.height - yCoor)
            pinkView.lean = startLean - yCoor / 2
            pinkView.circleRadiusPortition =  radiusPortition - yCoor * 0.001
        }
    }
}
