//
//  Helper.swift
//  JuJitsuScoreboard
//
//  Created by Moulinet Chloë on 10/04/2018.
//  Copyright © 2018 chloemoulinet. All rights reserved.
//

import UIKit

public class Helper {

    public static func displayTwoDigitsScore(score: Int) -> String {
        return String(format: "%02d", score)
    }
    
    public static func formatDouble(_ number: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: number as NSNumber)
    }

    public static func formatTimeInterval(interval: TimeInterval) -> String {
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        timeFormatter.unitsStyle = .brief
        return timeFormatter.string(from: interval) ?? "0s"
    }

    public static func formatTimeIntervalWithoutDecimal(interval: TimeInterval) -> String {
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        timeFormatter.string(from: interval)
        return timeFormatter.string(from: interval) ?? "0"
    }
    
    public static func formatTimeIntervalWithoutDecimalAndTwoDigits(interval: TimeInterval) -> String {
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        if let string = timeFormatter.string(from: interval) {
            if interval.isEqual(to: 0.0) || interval.isEqual(to: 5.0) {
                return "0\(string)"
            } else {
                return string
            }
        }
        return ""
    }
}
