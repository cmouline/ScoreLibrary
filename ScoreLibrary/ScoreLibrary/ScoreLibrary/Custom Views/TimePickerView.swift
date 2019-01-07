//
//  TimePickerView.swift
//  JuJitsuScoreboard
//
//  Created by Work on 21/12/2018.
//  Copyright © 2018 chloemoulinet. All rights reserved.
//

import UIKit

public class TimePickerView: GradientView, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var closeButton: CustomScoreButton!

    var timeData: [[TimeInterval]] = [[TimeInterval]]()
    
    public var mainTimerDelegate: MainTimerDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibInit()
    }
    
    private func xibInit() {
        Bundle.main.loadNibNamed("TimePickerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setup()
    }
    
    func setup() {
        for name in UIFont.familyNames {
            print(name, separator: "", terminator: "")
            if let nameString = name as? String
            {
                print(UIFont.fontNames(forFamilyName: nameString), separator: "", terminator: "")
            }
        }

        self.alpha = 0
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 20

        timePicker.delegate = self
        timePicker.dataSource = self
        
        timeData = [[0, 1, 2, 3, 4, 5],
                    [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]]
        
        closeButton.setButtonStyle(style: .closeTime)
        closeButton.addTarget(self, action: #selector(closeOverlay(_:)), for: .touchDown)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeData[component].count
    }
    
    private func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var title: String
        if component == 1  {
            title = Helper.formatTimeIntervalWithoutDecimalAndTwoDigits(interval: timeData[component][row])
        } else {
            title = Helper.formatTimeIntervalWithoutDecimal(interval: timeData[component][row])
        }
        let pickerLabel = UILabel()
        let myTitle = NSAttributedString(string: title,
                                         attributes: [
                                            NSAttributedString.Key.font: UIFont(name: "LemonMilk", size: 28.0)!,
                                            NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        pickerLabel.textAlignment = .center
        pickerLabel.text = title
        return pickerLabel
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1  {
            return Helper.formatTimeIntervalWithoutDecimalAndTwoDigits(interval: timeData[component][row])
        } else {
            return Helper.formatTimeIntervalWithoutDecimal(interval: timeData[component][row])
        }
    }
    
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minutes = timeData[0][pickerView.selectedRow(inComponent: 0)]
        let seconds = timeData[1][pickerView.selectedRow(inComponent: 1)]
        mainTimerDelegate?.resetMainTimer()
        mainTimerDelegate?.setCountDownMainTimer(time: TimeInterval((minutes * 60) + seconds))
    }

    @objc func closeOverlay(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3,
                       animations: { [weak self] in
                        self?.alpha = 0
                        self?.transform = CGAffineTransform(scaleX: 2, y: 2) })
    }

}
