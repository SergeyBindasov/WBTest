//
//  ViewController.swift
//  WBTest
//
//  Created by Sergey on 31.05.2022.
//

import UIKit
import SnapKit


class OffersViewController: UIViewController {
    
    private lazy var table: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .white
        tv.register(FlightCellTableViewCell.self, forCellReuseIdentifier: String(describing: FlightCellTableViewCell.self))
        tv.delegate = self
        tv.dataSource = self
        
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Промо билеты"
        setupLayout()
    }
}
//MARK: - TableViewMethods
extension OffersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightCellTableViewCell.self), for: indexPath) as! FlightCellTableViewCell
       
        return cell
    }
    
    
    
}
//MARK: - InternalMethods
extension OffersViewController {
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubviews(table)
        
        table.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}





