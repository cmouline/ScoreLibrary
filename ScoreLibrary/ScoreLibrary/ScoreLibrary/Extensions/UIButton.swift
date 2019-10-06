//
//  UIButton.swift
//  JuJitsuScoreboard
//
//  Created by Moulinet Chloë on 07/09/2018.
//  Copyright © 2018 chloemoulinet. All rights reserved.
//

import UIKit

public extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
}
