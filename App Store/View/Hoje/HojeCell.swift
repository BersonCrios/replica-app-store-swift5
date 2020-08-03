//
//  HojeCell.swift
//  App Store
//
//  Created by Guilherme Berson on 31/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class HojeCell: UICollectionViewCell {
    
   var hojeApp: HojeApp? {
        didSet {
            if let hojeApp = hojeApp {
                categoriaLabel.text = hojeApp.categoria
                tituloLabel.text = hojeApp.titulo
                descricaoLabel.text = hojeApp.descricao
                
                if let imagem = hojeApp.imagemUrl {
                    imagemView.image = UIImage(named: imagem)
                }
                
                if let background = hojeApp.backgroundColor {
                    self.backgroundColor = UIColor(hexString: background)
                }
                
            }
        }
    }
    
    let categoriaLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let tituloLabel: UILabel = .textBoldLabel(text: "Explore o mundo\n sem medo", fontSize: 28, numbersOfLine: 2)
    let imagemView: UIImageView = .hojeImageView(named: "destaque-1")
    let descricaoLabel: UILabel = .textLabel(text: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a encontrarmos dentro de nós", fontSize: 14, numbersOfLine: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imagemView)
        imagemView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imagemView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imagemView.size(size: .init(width: bounds.width, height: 250))
        
        let stackview = UIStackView(arrangedSubviews: [categoriaLabel,
                                                       tituloLabel,
                                                       boxView,
                                                       descricaoLabel])
        stackview.axis = .vertical
        stackview.spacing = 8
        addSubview(stackview)
//        stackview.preencherSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackview.preencher(top: self.safeAreaLayoutGuide.topAnchor,
                            leading: leadingAnchor,
                            bottom: bottomAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
