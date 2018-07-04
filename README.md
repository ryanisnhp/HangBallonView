# **Hang Ballon View**
Simple example use **UIBezierPath** and animate view when scroll the view

Inspiration from [here](https://dribbble.com/shots/3191881-xishi-coming)
![inspiration](https://cdn.dribbble.com/users/1497404/screenshots/3191881/drbbble_pick6.png)

# **Screenshot and Demo**
![screenshot](https://github.com/ryanisnhp/HangBallonView/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202018-07-04%20at%2017.52.05_framed.png?raw=true)

*This project includes a demo iOS app.*
<img src='https://i.imgur.com/C52TXlB.gif' alt='Scroll down and up' width='600'>
# **Customize**
**Create view by this way**
```swift
topFrame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 300.0)
pinkView = PinkCurvedView(frame: topFrame)
        
pinkView.bottomY = startBottomY 
pinkView.centerImage = centerImage // image in the center
pinkView.backgroundColor = UIColor.clear // background color for the curved view
pinkView.imageBorderWidth = 4. 0 // border width 
pinkView.lean = startLean // See in the picture below
pinkView.circleRadiusPortition = radiusPortition // circle width / view width
pinkView.imageBorderColor = UIColor(rgb: 0xfbf0f0) // image border color
pinkView.frameFillColor = UIColor(rgb: 0xdfd3d3) // fill color onto the view
pinkView.frameBorderColor = UIColor(rgb: 0xb8b0b0) // outside border color
view.addSubview(pinkView)
```
Lean is the length of the vertical line in this picture

![lean](https://github.com/ryanisnhp/HangBallonView/blob/master/Screen%20Shot%202018-07-04%20at%206.21.11%20PM.png?raw=true)
