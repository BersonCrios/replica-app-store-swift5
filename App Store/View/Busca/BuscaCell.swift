//
//  BuscaCell.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit
import SDWebImage

class BuscaCell: UITableViewCell {
    
    
    var app: App! {
        didSet {
            tituloLabel.text = app.nome
            empresaLabel.text = app.empresa
            
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenShotUrls = app.screenshotUrls {
                if screenShotUrls.count > 0 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenShotUrls[0]), completed: nil)
                }
                
                if screenShotUrls.count > 1 {
                    self.screenshot2ImageView.sd_setImage(with: URL(string: screenShotUrls[1]), completed: nil)
                }
                
                if screenShotUrls.count > 2 {
                    self.screenshot3ImageView.sd_setImage(with: URL(string: screenShotUrls[2]), completed: nil)
                }
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView()
    let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numbersOfLine: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14)
    let obterButton: UIButton = .obterbutton()

    let screenshot1ImageView: UIImageView = .screenShotImageView()
    let screenshot2ImageView: UIImageView = .screenShotImageView()
    let screenshot3ImageView: UIImageView = .screenShotImageView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tituloEmpresaStackView = UIStackView(arrangedSubviews: [tituloLabel,
                                                                    empresaLabel])
        tituloEmpresaStackView.spacing = 8
        tituloEmpresaStackView.axis = .vertical
        
        let headerStackview = UIStackView(arrangedSubviews: [iconeImageView,
                                                       tituloEmpresaStackView,
                                                       obterButton])
        headerStackview.spacing = 12
        headerStackview.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView,
                                                                 screenshot2ImageView,
                                                                 screenshot3ImageView])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [headerStackview,
                                                             screenShotStackView])
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.preencherSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
