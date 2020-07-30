//
//  AppService.swift
//  App Store
//
//  Created by Guilherme Berson on 29/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import Foundation


class AppService {
    
    let API = "https://api.euprogramador.app/app-store/v1"
    
    
    static let shared = AppService()
    
    func  buscaAppsEmDestaque (completion: @escaping ([AppDestaque]?, Error?) -> ()) {
        guard let  url = URL(string: "\(API)/apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do{
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([AppDestaque].self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
            }
        }.resume()
    }
    
    
    func buscaGrupo (tipo: String, completion: @escaping (AppGrupo?, Error?) -> ()) {
        guard let  url = URL(string: "\(API)/apps/\(tipo)") else {return}
              
              URLSession.shared.dataTask(with: url){
                  (data, res, err) in
                  if let err = err {
                      completion(nil, err)
                      return
                  }
                  do{
                      guard let data = data else {return}
                      let apps = try JSONDecoder().decode(AppGrupo.self, from: data)
                      completion(apps, nil)
                  } catch let err {
                      completion(nil, err)
                  }
              }.resume()
    }
}
