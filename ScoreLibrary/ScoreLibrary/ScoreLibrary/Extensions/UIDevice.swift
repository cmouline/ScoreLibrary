//
//  UIDevice.swift
//  ScoreLibrary
//
//  Created by Moulinet Chloë on 30/01/2019.
//  Copyright © 2019 Moulinet Chloë. All rights reserved.
//

import UIKit
import AVFoundation

public extension UIDevice {
    
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
