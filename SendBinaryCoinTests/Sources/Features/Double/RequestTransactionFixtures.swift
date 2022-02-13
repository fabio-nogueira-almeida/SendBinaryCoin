//
//  RequestTransactionFixtures.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

extension RequestTransactionViewData {
    static var mock = RequestTransactionViewData(countries: [.mock, .mock])
}

extension Country {
    static var mock = Country(name: "", currency: "", phonePrefix: "", phoneQtd: 0)
}


