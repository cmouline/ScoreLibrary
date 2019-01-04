//
//  MainTimerDelegate.swift
//  ScoreLibrary
//
//  Created by Moulinet Chloë on 02/01/2019.
//  Copyright © 2019 Moulinet Chloë. All rights reserved.
//

import Foundation

public protocol MainTimerDelegate: class {
    func pauseMainTimer()
    func resetMainTimer()
    func setCountDownMainTimer(time: TimeInterval)
}
