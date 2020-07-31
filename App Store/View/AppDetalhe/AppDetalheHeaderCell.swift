//
//  AppDetalheHeaderCell.swift
//  App Store
//
//  Created by Guilherme Berson on 31/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class AppDetalheHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nomelabel.text = app.nome
                empresalabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 128, heigth: 128)
    let nomelabel: UILabel = .textLabel(text: "App name", fontSize: 20, numbersOfLine: 2)
    let empresalabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let obterButton: UIButton = .obterbutton()

    
     override init(frame: CGRect) {
            super.init(frame: frame)
            
        
        iconeImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [obterButton,
                                                             UIView()])
        
        let nomeEmpresaStackView = UIStackView(arrangedSubviews: [ nomelabel,
                                                                   empresalabel,
                                                                   buttonStackView])
        nomeEmpresaStackView.spacing = 12
        nomeEmpresaStackView.axis = .vertical
    
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView,
                                                      nomeEmpresaStackView])
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))

        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
}
