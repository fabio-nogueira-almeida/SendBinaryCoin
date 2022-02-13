//
//  RequestTransactionInteractorInputProtocolSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

final class RequestTransactionInteractorInputProtocolSpy: RequestTransactionInteractorInputProtocol {

    private(set) var fetchDataCalled = false
    private(set) var findExchangeRateCalled = false
    private(set) var convertCalled = false
    private(set) var shouldValidateCalled = false

    func fetchData() {
        fetchDataCalled = true
    }
    
    func findExchangeRate(for: Country) {
        findExchangeRateCalled = true
    }
    
    func convert(coin: String) {
        convertCalled = true
    }
    
    func shouldValidate(phone: String) {
        shouldValidateCalled = true
    }
}
