//
//  HappinessDebugViewController.swift
//  happyReDebug
//
//  Created by 李弋 on 7/29/15.
//  Copyright (c) 2015 李弋. All rights reserved.
//

import UIKit

class HappinessDebugViewController: UIViewController, ScaleRadius {
  
    var gettedScale = 0.959
    var gettedLineWidth = 5
    
    @IBOutlet weak var faceShowInstance: FaceShowPannel! {
        didSet {
            println("gettedScale is \(gettedScale)")
            println("gettedLineWidth is \(gettedLineWidth)")
            faceShowInstance.getScale = self
            faceShowInstance.addGestureRecognizer(UIPinchGestureRecognizer( target: faceShowInstance, action: "pinchScaleForCircle"))
        }
    }
    func setScaleForRadius(sender: FaceShowPannel) -> CGFloat? {
        return CGFloat(gettedScale)
    }
    func setLineWidthForRadius(sender: FaceShowPannel) -> CGFloat? {
        return CGFloat(gettedLineWidth)
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


