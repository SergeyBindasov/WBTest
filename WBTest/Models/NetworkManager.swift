//
//  NetworkManager.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation

class NetworkManager {
    
    let help = DateHelp()
    
    var delegate: FlightsDelegate?

    func performRequest() {
        if let url = URL(string: "https://travel.wildberries.ru/statistics/v1/cheap") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
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
                                         id: flight.searchToken)
                flights.append(flight)
            }
            return flights
        } catch {
            print(error)
            return nil
        }
    }
}
