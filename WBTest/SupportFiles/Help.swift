//
//  Help.swift
//  WBTest
//
//  Created by Sergey on 01.06.2022.
//

import Foundation

struct DateHelp {
    
    let formatter = ISO8601DateFormatter()
    let dateFormatter = DateFormatter()
    let numberFormatter = NumberFormatter()
    
    func timeFromISO(iso: String) -> String {
        let date = formatter.date(from: iso)
        dateFormatter.dateFormat = "HH:mm"
        guard let newDate = date else { return ""}
        let resultTime = dateFormatter.string(from: newDate)
        return resultTime
    }
    
    func dateFromISO(iso: String) -> String {
        let date = formatter.date(from: iso)
        dateFormatter.dateFormat = "EE, dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        guard let newDate = date else { return ""}
        let resultDate = dateFormatter.string(from: newDate)
        return resultDate
    }
    
    func numberSeparator(number: Int) -> String {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        numberformatter.groupingSeparator = " "
        guard let formattedString = numberformatter.string(for: number) else { return ""}
        return formattedString
    }
}
