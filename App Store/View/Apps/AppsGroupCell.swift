//
//  AppsGroupCell.swift
//  App Store
//
//  Created by Guilherme Berson on 30/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    var grupo: AppGrupo? {
        didSet {
            if let grupo = grupo {
                tituloLabel.text = grupo.titulo
                appsGroupHorizontalViewController.apps = grupo.apps
            }
        }
    }
    
    let tituloLabel: UILabel = .textBoldLabel(text: "App Group Title", fontSize: 24)
    
    let appsGroupHorizontalViewController = AppsGroupHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(tituloLabel)
        tituloLabel.preencher(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: nil,
                              trailing: trailingAnchor,
                              padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(appsGroupHorizontalViewController.view)
        appsGroupHorizontalViewController.view.preencher(top: topAnchor,
                                                         leading: leadingAnchor,
                                                         bottom: bottomAnchor,
                                                         trailing: trailingAnchor,
                                                         padding: .init(top: 30, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
