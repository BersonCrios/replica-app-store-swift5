//
//  AppDetalheDescricaoCell.swift
//  App Store
//
//  Created by Guilherme Berson on 31/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class AppDetalheDescricaoCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                descricaoLabel.text = app.descricao
            }
        }
    }
    
    let tituloLabel: UILabel = .textBoldLabel(text: "Novidades", fontSize: 24)
    let descricaoLabel: UILabel = .textLabel(text: "descricao.", fontSize: 16, numbersOfLine: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let stackview = UIStackView(arrangedSubviews: [tituloLabel,
                                                       descricaoLabel])
        stackview.spacing = 12
        stackview.axis = .vertical
        addSubview(stackview)
        stackview.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
