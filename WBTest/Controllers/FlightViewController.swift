//
//  FlightViewController.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation
import UIKit

class FlightViewController: UIViewController {
    
    let myview = DetailsView()
    var flight: FlightModel
    
    init(flight: FlightModel) {
        self.flight = flight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Подробности"
        
        view = myview
        myview.updateUI(with: flight)
    }
    
}
