//
//  UILabel.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

extension UILabel {
    static func textLabel(text: String, fontSize: CGFloat, numbersOfLine: Int = 1) -> UILabel{
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numbersOfLine
        label.text = text
        
        return label
    }
}
