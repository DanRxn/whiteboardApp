//
//  DrawView.swift
//  White Board App
//
//  Created by Robertson, Dan on 8/1/16.
//  Copyright © 2016 Dan Robertson. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var lines: [Line] = []
    var lastPoint: CGPoint!

    

/*  ---> Not Required
     
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
*/
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastPoint = touches.first?.locationInView(self)
    }
     

 
 
/* -->>  Modeled after stuff online:
     
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.locationInView(self)
            print("\(lastPoint)")
        }
    }
    
*/
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let newPoint = touches.first?.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint!))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        //CGContextSetLineCap(context, kCGLineCapRound)   <<-- ◻️WTF is wrong with that???
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
