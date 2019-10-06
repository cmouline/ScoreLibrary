//
//  CustomScoreButton.swift
//  JuJitsuScoreboard
//
//  Created by Moulinet Chloë on 07/05/2018.
//  Copyright © 2018 chloemoulinet. All rights reserved.
//

import UIKit

enum ButtonStyle {
    // Common
    case closeTime
}

public typealias ButtonScoreClosure = (CustomScoreButton) -> Void

@IBDesignable
public class CustomScoreButton: UIButton {

    var highlightedColor: UIColor?
    var simpleTouchUp: ButtonScoreClosure?
    var doubleTouchUp: ButtonScoreClosure?
    var isActivated: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureActions()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureActions()
    }

    override open var isHighlighted: Bool {
        didSet {
            if let highlightedColor = highlightedColor {
                backgroundColor = isHighlighted ? highlightedColor : .clear
            }
        }
    }

    func setButtonStyle(style: ButtonStyle) {
        titleLabel?.adjustsFontSizeToFitWidth = true
        
        switch style {
        case .closeTime :
            setTitle("\u{f00d}", for: .normal)
            setTitleColor(.white, for: .normal)
            titleLabel?.font = UIFont(name: "FontAwesome", size: 50)
        }
    }

    // MARK: - Private functions

    func configureActions() {
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(CustomScoreButton.simpleTouchUp(_:)))
        singleTap.numberOfTapsRequired = 1
        addGestureRecognizer(singleTap)

        let doubleTap = UITapGestureRecognizer(target: self, action:#selector(CustomScoreButton.doubleTouchUp(_:)))
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)

        singleTap.require(toFail: doubleTap)
    }

    // MARK: - Actions

    @objc func simpleTouchUp(_ sender: CustomScoreButton) {
        simpleTouchUp?(sender)
    }

    @objc func doubleTouchUp(_ sender: CustomScoreButton) {
        doubleTouchUp?(sender)
    }

}
