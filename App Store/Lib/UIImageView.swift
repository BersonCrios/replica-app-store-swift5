//
//  UIImageView.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

extension UIImageView {
    static func iconeImageView (width: CGFloat = 64, heigth: CGFloat = 64) -> UIImageView{
        let image = UIImageView()
        
        image.size(size: .init(width: width, height: heigth))
        image.backgroundColor = .purple
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
    }
    
    static func screenShotImageView (width: CGFloat = 64, heigth: CGFloat = 64) -> UIImageView{
        let image = UIImageView()
        
        image.backgroundColor = .purple
        image.layer.cornerRadius = 12
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }
    
}
