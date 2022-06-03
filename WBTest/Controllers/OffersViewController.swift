//
//  ViewController.swift
//  WBTest
//
//  Created by Sergey on 31.05.2022.
//

import UIKit
import SnapKit

class OffersViewController: UIViewController {
    
    let network: NetworkManager
    var currentFlights: [FlightModel] = []

    init(network: NetworkManager) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var table: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .white
        tv.register(FlightCellTableViewCell.self, forCellReuseIdentifier: String(describing: FlightCellTableViewCell.self))
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Промо билеты"
        setupLayout()
        network.delegate = self
        network.performRequest()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        table.reloadData()
    }
}
//MARK: - UpdateFlights
extension OffersViewController: FlightsDelegate {
    func didUpdateFlights(_ networkManager: NetworkManager, flights: [FlightModel]) {
        for flight in flights {
            currentFlights.append(flight)
            table.reloadData()
        }
    }
}

extension OffersViewController: LikesOnCellDelegate {
    func onLikeClick(isLiked: Bool, cell: UITableViewCell?) {
        guard let indexPath = table.indexPath(for: cell!) else { return }
        var fligh = currentFlights[indexPath.row].isLiked
        fligh = isLiked
        currentFlights[indexPath.row].isLiked = fligh
    }
}

//MARK: - TableViewMethods
extension OffersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFlights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightCellTableViewCell.self), for: indexPath) as! FlightCellTableViewCell
        cell.updateCell(with: currentFlights[indexPath.row])
        currentFlights[indexPath.row].index = indexPath.row
        cell.delegate = self
        cell.index = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flightDetailsVC = FlightViewController(flight: currentFlights[indexPath.row])
        flightDetailsVC.callBack = { [weak self] Int, Bool in
            self?.currentFlights[Int].isLiked = Bool
        }
        navigationController?.show(flightDetailsVC, sender: nil)
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
