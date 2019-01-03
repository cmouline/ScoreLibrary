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
//    case menu
//    case reset
//    case medicalTime
//    case victory
//    case close
    case closeTime
//    case backWhite
//    case backGray
//    case home
//    case noFighterSelected
//    case commonGrayButton
//
//    // Fight
//    case shidoSelected
//    case chuiSelected
//    case hansokumakeSelected
//    case forfeitSelected
//    case shidoUnselected
//    case chuiUnselected
//    case hansokumakeUnselected
//    case forfeitUnselected
//    case leftFighterSelected
//    case rightFighterSelected
//
//    // Duo
//    case primaryKeyPad
//    case secondaryKeyPad
//    case submitKeyPad
//    case notation
//    case forfeitDuo
//    case leftTeamSelected
//    case rightTeamSelected
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
            setTitleColor(.black, for: .normal)
            titleLabel?.font = UIFont(name: "FontAwesome", size: 25)
            contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 15, right: 15)
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
