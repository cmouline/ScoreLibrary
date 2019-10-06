//
//  UIView.swift
//  ScoreLibrary
//
//  Created by Moulinet Chloë on 28/01/2019.
//  Copyright © 2019 Moulinet Chloë. All rights reserved.
//

import UIKit

public extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { subview in
            self.addSubview(subview)
        }
    }
    
    func setBorder(cornerRadius: CGFloat?, borderWidth: CGFloat, borderColor: UIColor) {
        let layer = self.layer
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    func setBorder(cornerMask: CACornerMask, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        let layer = self.layer
        if #available(iOS 11.0, *) {
            layer.maskedCorners = cornerMask
            layer.cornerRadius = cornerRadius
        } else {
            // Fallback on earlier versions
        }
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    func startBlinking() {
        UIView.animate(withDuration: 0.8, delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: { self.alpha = 0 },
                       completion: nil
        )
    }
    
    func stopBlinking(keepShowing: Bool) {
        layer.removeAllAnimations()
        if keepShowing {
            self.alpha = 1
        }
    }
    
    func pauseAnimation() {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resumeAnimation() {
        let pausedTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
}
