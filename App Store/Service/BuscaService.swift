//
//  BuscaService.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class BuscaService {
    
    static let shared = BuscaService()
    
    func buscaApps(text:String, comletion: @escaping ([App]?, Error?) -> ()){
        guard let url = URL(string: "https://api.euprogramador.app/app-store/v1//apps?search=\(text)") else {return}
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            if let err = err {
                comletion(nil, err)
                return
            }
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([App].self, from: data)
                comletion(apps, nil)
            } catch  let err {
                comletion(nil, err)
                return
            }
        }.resume()
    }
}
