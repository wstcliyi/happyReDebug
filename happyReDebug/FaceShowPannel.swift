//
//  FaceShowPannel.swift
//  happyReDebug
//
//  Created by 李弋 on 7/29/15.
//  Copyright (c) 2015 李弋. All rights reserved.
//

import UIKit

protocol ScaleRadius :class {
    func    setScaleForRadius(sender: FaceShowPannel)->CGFloat?
    func    setLineWidthForRadius(sender: FaceShowPannel)->CGFloat?
}

class FaceShowPannel: UIView {
    
    weak var getScale:ScaleRadius?
    
//    var scaleRadius:CGFloat {  return getScale?.setScaleForRadius(self) ?? CGFloat(1) }
    var scaleRadius:CGFloat = 1 { didSet { setNeedsDisplay() }}
    var changableRadius: CGFloat { return min(bounds.size.height, bounds.size.width)/2 * scaleRadius }
    var circleCenter:CGPoint { return convertPoint(center, fromCoordinateSpace: superview!) }
    var lineWidth : CGFloat { return  getScale?.setLineWidthForRadius(self) ?? CGFloat(3) }
    var Color =   UIColor.redColor() { didSet { setNeedsDisplay() } }
    
     func pinchScaleForCircle(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .Changed {
            scaleRadius  = scaleRadius * gesture.scale
        }
    }
    
    
    override func drawRect(rect: CGRect) {
        println("circleCenter  is  \(circleCenter)       changableRadius   is \(changableRadius)       scaleRadius  is   \(scaleRadius)"  )
        let facePath = UIBezierPath(arcCenter: circleCenter, radius: changableRadius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
      
        facePath.lineWidth = lineWidth
        Color.set()
        facePath.stroke()
        
    }
}
