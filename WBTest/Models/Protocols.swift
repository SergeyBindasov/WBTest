//
//  Protocols.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation
import UIKit

protocol FlightsDelegate: AnyObject {
    func didUpdateFlights(_ networkManager: NetworkManager, flights: [FlightModel])
}

protocol LikesOnCellDelegate: AnyObject {
    func onLikeClick(isLiked: Bool, cell: UITableViewCell?) 
}
