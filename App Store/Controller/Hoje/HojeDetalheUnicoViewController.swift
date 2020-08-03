//
//  HojeDetalheUnicoViewController.swift
//  App Store
//
//  Created by Guilherme Berson on 02/08/20.
//  Copyright © 2020 Guilherme Berson. All rights reserved.
//

import UIKit

class HojeDetalheUnicoViewController: UITableViewController {
    
    var hojeApp: HojeApp?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(HojeDetalheUnicoCell.self, forCellReuseIdentifier: cellId)
        self.adicionaHeader()
    }
    
    func adicionaHeader () {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))

        let hojeCell = HojeCell()
        hojeCell.hojeApp = self.hojeApp
        hojeCell.layer.cornerRadius = 0
        
        headerView.addSubview(hojeCell)
        hojeCell.preencherSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
    
}


extension HojeDetalheUnicoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeDetalheUnicoCell
        return cell
    }
}
