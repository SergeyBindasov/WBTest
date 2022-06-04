//
//  NetworkManager.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation
import IHProgressHUD

class NetworkManager {
    
    let help = DateHelp()
        
    var delegate: FlightsDelegate?

    func performRequest() {
        IHProgressHUD.show(withStatus: "Ищем лучшие билеты")
        if let url = URL(string: "https://travel.wildberries.ru/statistics/v1/cheap") {
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            var request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    IHProgressHUD.dismiss()
                    if let flightsList = self.parseFlightJSON(flightData: safeData) {
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateFlights(self, flights: flightsList)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseFlightJSON(flightData: Data) -> [FlightModel]? {
        let decoder = JSONDecoder()
        do {
            var flights = [FlightModel]()
            let decodedData = try decoder.decode(FlightData.self, from: flightData)
            decodedData.data.forEach { flight in
                var flight = FlightModel(departureCity: flight.startCity,
                                         departureCode: flight.startCityCode,
                                         destinationCity: flight.endCity,
                                         destinationCode: flight.endCityCode,
                                         departureDate: help.dateFromISO(iso: flight.startDate),
                                         detaprureTime: help.timeFromISO(iso: flight.startDate),
                                         arrivalDate: help.dateFromISO(iso: flight.endDate),
                                         arrivalTime: help.timeFromISO(iso: flight.endDate),
                                         price: help.numberSeparator(number: flight.price),
                                         id: flight.searchToken,
                                         index: 0,
                                         isLiked: false)
                flights.append(flight)
            }
            return flights
        } catch {
            print(error)
            return nil
        }
    }
}
