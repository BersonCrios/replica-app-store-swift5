//
//  HojeDetalheViewController.swift
//  App Store
//
//  Created by Guilherme Berson on 01/08/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class HojeDetalheViewControlle: UIViewController {
    
    var hojeApp: HojeApp? {
        didSet {
            
            if hojeApp != nil {
                self.adicionaUnico()
            }
            
        }
    }
    
    let fecharButton: UIButton = .fecharbutton()
    
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthContraint: NSLayoutConstraint?
    var heightContraint: NSLayoutConstraint?
    
    let hojeDetalheUnicoViewController = HojeDetalheUnicoViewController()
    
    //FUNÇÃO DE CALLBACK
    var handlerFechar: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        self.adicionaBotaoFechar()
    }
    
    func adicionaBotaoFechar () {
        view.addSubview(fecharButton)
        
        fecharButton.alpha = 0
        fecharButton.addTarget(self, action: #selector(handlerFecharClique), for: .touchUpInside)
        fecharButton.preencher(top: self.view.safeAreaLayoutGuide.topAnchor,
                               leading: nil,
                               bottom: nil,
                               trailing: view.trailingAnchor,
                               padding: .init(top: 18, left: 0, bottom: 0, right: 24),
                               size: .init(width: 32, height: 32))
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: {self.fecharButton.alpha = 1}, completion: nil)
    }
    
    func adicionaUnico () {
        hojeDetalheUnicoViewController.hojeApp = self.hojeApp
        self.centerView = hojeDetalheUnicoViewController.view
        self.animacao()
    }
    
    func animacao () {
        guard let centerView = self.centerView else {return}
        guard let frame = self.frame else {return}
        
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        self.adicionaBotaoFechar()
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthContraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightContraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthContraint?.isActive = true
        self.heightContraint?.isActive = true
        
        view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthContraint?.constant = self.view.frame.width
            self.heightContraint?.constant = self.view.frame.height
            
            self.centerView?.layer.cornerRadius = 0
            
            self.view.layoutIfNeeded()
        } , completion: nil)
    }
    
    
    func animacaoFechar (){
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {
            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x
                self.widthContraint?.constant = frame.width
                self.heightContraint?.constant = frame.height
                
                self.centerView?.layer.cornerRadius = 16
                
                self.view.layoutIfNeeded()
            }
        }) {(_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc func handlerFecharClique() {
        self.fecharButton.isHidden = true
        self.handlerFechar?()
        self.animacaoFechar()
        
    }
    
}
