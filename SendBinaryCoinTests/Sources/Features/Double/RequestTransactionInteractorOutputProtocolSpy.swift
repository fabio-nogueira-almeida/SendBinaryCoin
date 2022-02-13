//
//  RequestTransactionInteractorOutputProtocolSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

final class RequestTransactionInteractorOutputProtocolSpy: RequestTransactionInteractorOutputProtocol {

    private(set) var fetchDataSuccessCalled = false
    private(set) var didFindExchangeRateCalled = false
    private(set) var didConvertCoinCalled = false
    private(set) var didValidatePhoneCalled = false
    private(set) var isValidatePhone = false
    private(set) var coinConverted = ""

    func fetchDataSuccess(viewData: RequestTransactionViewData) {
        fetchDataSuccessCalled = true
    }
    
    func didFindExchangeRate(value: String) {
        didFindExchangeRateCalled = true
    }
    
    func didConvertCoin(value: String) {
        didConvertCoinCalled = true
        coinConverted = value
    }
    
    func didValidatePhone(isValid: Bool) {
        didValidatePhoneCalled = true
        isValidatePhone = isValid
    }
}
