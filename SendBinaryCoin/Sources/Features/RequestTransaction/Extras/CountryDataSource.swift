//
//  CountryDataSource.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

struct Country {
    var name: String
    var currency: String
    var phonePrefix: String
    var phoneQtd: Int
}

struct CountryDataSource {
    static func generateData() -> [Country] {
        return [
            Country(name: "Kenya", currency: "KES", phonePrefix: "+254", phoneQtd: 9),
            Country(name: "Nigeria", currency: "NGN", phonePrefix: "+234", phoneQtd: 7),
            Country(name: "Tanzania", currency: "TZS", phonePrefix: "+255", phoneQtd: 9),
            Country(name: "Uganda", currency: "UGX", phonePrefix: "+256", phoneQtd: 7)
        ]
    }
    
}
