//
//  Protocols.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation

protocol FlightsDelegate {
    func didUpdateFlights(_ networkManager: NetworkManager, flights: [FlightModel])
}

