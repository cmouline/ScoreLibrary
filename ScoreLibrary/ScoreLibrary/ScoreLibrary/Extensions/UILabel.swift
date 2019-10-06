//
//  UILabel.swift
//  ScoreLibrary
//
//  Created by Moulinet Chloë on 31/01/2019.
//  Copyright © 2019 Moulinet Chloë. All rights reserved.
//

import Foundation

public extension UILabel {
    
    func setFont(fontName: String, size: CGFloat?) {
        if let size = size {
            self.font = UIFont(name: fontName, size: size)
        } else {
            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}
