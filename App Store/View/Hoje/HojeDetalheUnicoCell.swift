//
//  HojeDetalheUnicoCell.swift
//  App Store
//
//  Created by Guilherme Berson on 02/08/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class HojeDetalheUnicoCell: UITableViewCell {
           
    let descricaoLabel: UILabel = {
        let label = UILabel()
        
        let atributoTexto = NSMutableAttributedString(
            string: "Lorem Ipsum",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
        )
        
        atributoTexto.append(NSAttributedString(
            string: " A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério. É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        
        atributoTexto.append(NSAttributedString(
            string: " \n\nDe onde ele vem ? ",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        )

        atributoTexto.append(NSAttributedString(
            string: " Mussum Ipsum, cacilds vidis litro abertis. Mé faiz elementum girarzis, nisi eros vermeio. Quem num gosta di mé, boa gentis num é. Casamentiss faiz malandris se pirulitá. Atirei o pau no gatis, per gatis num morreus.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        
        atributoTexto.append(NSAttributedString(
            string: " \n\nDe onde ele vem ? ",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        )

        atributoTexto.append(NSAttributedString(
            string: " Mussum Ipsum, cacilds vidis litro abertis. Mé faiz elementum girarzis, nisi eros vermeio. Quem num gosta di mé, boa gentis num é. Casamentiss faiz malandris se pirulitá. Atirei o pau no gatis, per gatis num morreus.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        atributoTexto.append(NSAttributedString(
            string: " \n\nDe onde ele vem ? ",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        )

        atributoTexto.append(NSAttributedString(
            string: " Mussum Ipsum, cacilds vidis litro abertis. Mé faiz elementum girarzis, nisi eros vermeio. Quem num gosta di mé, boa gentis num é. Casamentiss faiz malandris se pirulitá. Atirei o pau no gatis, per gatis num morreus.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        atributoTexto.append(NSAttributedString(
            string: " \n\nDe onde ele vem ? ",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        )

        atributoTexto.append(NSAttributedString(
            string: " Mussum Ipsum, cacilds vidis litro abertis. Mé faiz elementum girarzis, nisi eros vermeio. Quem num gosta di mé, boa gentis num é. Casamentiss faiz malandris se pirulitá. Atirei o pau no gatis, per gatis num morreus.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        label.attributedText = atributoTexto
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descricaoLabel)
        descricaoLabel.preencherSuperview(padding: .init(top: 24,
                                                         left: 24,
                                                         bottom: 24,
                                                         right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
