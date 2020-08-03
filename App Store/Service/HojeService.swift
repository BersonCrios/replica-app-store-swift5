//
//  HojeService.swift
//  App Store
//
//  Created by Guilherme Berson on 03/08/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import Foundation

class HojeService {
    
    static let shared = HojeService()
    
    func buscaHojeDestaques (completion: @escaping ([HojeApp]?, Error?) -> ()) {
        let hojeApp: Array<HojeApp> = [
            HojeApp(
                id: 1,
                categoria: "VIAGEM",
                titulo: "Explore o mundo \nsem medo",
                imagemUrl: "destaque-1",
                descricao: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a encontrarmos dentro de nós",
                backgroundColor: "#FFFFFF"
            ),
            
            HojeApp(
                id: 2,
                categoria: "PRATIQUE HOJE",
                titulo: "Mantenha o corpo \ne mente saudáveis",
                imagemUrl: "destaque-2",
                descricao: "Quanto mais se rema, maiores são as chances de pegar as melhores ondas, tanto no surf quanto na vida",
                backgroundColor: "#69CCE0"
            )
        ]
        
        completion(hojeApp, nil)
    }
    
}
