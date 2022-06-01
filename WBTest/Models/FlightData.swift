//
//  FlightData.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation

struct FlightData: Codable {
    var data: [Flight]
}

struct Flight: Codable {
    var startCity: String
    var startCityCode: String
    var endCity: String
    var endCityCode: String
    var startDate: String
    var endDate: String
    var price: Int
    var searchToken: String
}
