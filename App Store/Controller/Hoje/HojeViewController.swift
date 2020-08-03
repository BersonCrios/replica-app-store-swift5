//
//  HojeViewController.swift
//  App Store
//
//  Created by Guilherme Berson on 31/07/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class HojeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let headerId = "headerId"
    var hojeApps: [HojeApp] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        collectionView.backgroundColor = .systemGroupedBackground 
        
        collectionView.register(HojeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HojeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.buscaHojeDestaques()
    }
    
    func buscaHojeDestaques () {
        HojeService.shared.buscaHojeDestaques { (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.hojeApps = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension HojeViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 90)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HojeHeader
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hojeApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HojeCell
        
        cell.hojeApp = self.hojeApps[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            if let frame = cell.superview?.convert(cell.frame, to: nil){
                
                tabBarController?.tabBar.isHidden = true
                
               let modalView = HojeDetalheViewControlle()
                modalView.modalPresentationStyle = .overCurrentContext
                
                modalView.handlerFechar = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                
                self.present(modalView, animated: false) {
                    modalView.frame = frame
                    modalView.hojeApp = self.hojeApps[indexPath.item]
                }
            }
        }
    }
}
