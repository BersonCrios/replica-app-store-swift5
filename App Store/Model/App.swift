//
//  App.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import Foundation

struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String?
    let iconeUrl: String
    let screenshotUrls: [String]?
}


struct AppDestaque: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
}

struct AppGrupo: Decodable {
    let id: String
    let titulo: String
    let apps: [App]

}
