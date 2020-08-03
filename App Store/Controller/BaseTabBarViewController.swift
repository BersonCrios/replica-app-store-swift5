//
//  BaseTabBarViewController.swift
//  App Store
//
//  Created by Guilherme Berson on 28/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

//IMPORT DA BIBLIOTECA DE INTERFACE
import UIKit

/*
    INICIANDO A CLASSE DE VIEW CONTROLLER (QUE ESTÁ DEFINIDA COMO A PRINCIPAL LÁ NO
 SceneDelegate, E EXTENDENDO A UITABBARCONTROLLER)
 */
class BaseTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            CRIANDO AS VIEW CONTROLLES QU SERÃO COLOCADAS NA TAB BAR
         */
        let hojeViewController = self.criarTabItem(viewController: HojeViewController(), titulo: "Hoje", imagem: "icone-hoje")
       
        
        let appsViewController = self.criarTabItem(viewController: AppsViewController(), titulo: "Apps", imagem: "icone-apps")
        
        
        let buscaViewController = self.criarTabItem(viewController:BuscaViewController(), titulo: "Busca", imagem: "icone-busca")
       
        
        
        /*
         ADICIONANDO ELAS AO ARRAY DE VIEW CONTROLLER PARA APARECER
         NA TAB BAR
         */
        viewControllers = [
            hojeViewController,
            appsViewController,
            buscaViewController
        ]
        selectedIndex = 0
        
    }
    
    
    /*
        FUNÇÃO QUE CRIA OS ITENS DA TAB VIEW
     */
    
    func criarTabItem(viewController: UIViewController, titulo: String, imagem: String) -> UIViewController{
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = titulo
        viewController.tabBarItem.title = titulo
        viewController.tabBarItem.image = UIImage(named: imagem)
        
        viewController.view.backgroundColor = .white
        
        return navController
    }
}
