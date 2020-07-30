//
//  AppGroupHorizontalCell.swift
//  App Store
//
//  Created by Guilherme Berson on 30/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class AppGroupHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                tituloLabel.text = app.nome
                empresaLabel.text = app.empresa
            }
        }
    }
    
    
    let iconeImageView: UIImageView = .iconeImageView()
    let tituloLabel: UILabel = .textLabel(text: "App Nome", fontSize: 18, numbersOfLine: 2)
    let empresaLabel: UILabel = .textLabel(text: "App Empresa", fontSize: 14)
    let obterButton: UIButton = .obterbutton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.cinza.cgColor
        layer.addSublayer(bottomLine)
        
        
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel,
                                                                    empresaLabel])
        tituloEmpresaStackView.axis = .vertical
        tituloEmpresaStackView.spacing = 4
        addSubview(tituloEmpresaStackView)
        
        let stackview = UIStackView(arrangedSubviews: [iconeImageView,
                                                       tituloEmpresaStackView,
                                                       obterButton])
        stackview.spacing = 12
        stackview.alignment = .center
    
        addSubview(stackview)
        stackview.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
