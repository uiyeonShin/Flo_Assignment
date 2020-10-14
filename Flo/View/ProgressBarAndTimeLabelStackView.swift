//
//  progressBarAndTimeLabelStackView.swift
//  Flo
//
//  Created by 신의연 on 2020/10/13.
//

import Foundation
import UIKit
class ProgressBarAndTimeLabelStackView: UIStackView {
    
    static var shared = ProgressBarAndTimeLabelStackView()
    
    lazy var progressSlider: UISlider = {
        var slider = UISlider()
        slider.maximumValue = Float(playList[0].duration)
        slider.minimumValue = 0
        slider.value = 0
        return slider
    }()
    
    lazy var timeLabel: UILabel = {
        var label = UILabel()
        label.text = "00:00"
        return label
    }()
    
    lazy var leftTimeLabel: UILabel = {
        var label = UILabel()
        let minute: Int = Int(playList[0].duration)/60
        let second: Int = Int(Double(playList[0].duration).truncatingRemainder(dividingBy: 60))
        label.text = String(format: "%02ld:%02ld", minute, second)
        return label
    }()
    
    lazy var timeLabelStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.axis = .vertical
        
        timeLabelStackView.addArrangedSubview(timeLabel)
        timeLabelStackView.addArrangedSubview(leftTimeLabel)
        self.addArrangedSubview(progressSlider)
        self.addArrangedSubview(timeLabelStackView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
