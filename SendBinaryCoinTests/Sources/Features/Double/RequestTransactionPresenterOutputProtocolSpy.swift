//
//  RequestTransactionPresenterOutputProtocolSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

final class RequestTransactionPresenterOutputProtocolSpy: RequestTransactionPresenterOutputProtocol {

    private(set) var setTitleCalled = false
    private(set) var setDataCalled = false
    private(set) var didConvertCoinCalled = false
    private(set) var didFindExchangeRateCalled = false
    private(set) var didValidatePhoneCalled = false

    func set(title: String) {
        setTitleCalled = true
    }
    
    func set(data: RequestTransactionViewData) {
        setDataCalled = true
    }
    
    func didConvertCoin(value: String) {
        didConvertCoinCalled = true
    }
    
    func didFindExchangeRate(value: String) {
        didFindExchangeRateCalled = true
    }
    
    func didValidatePhone(isValid: Bool) {
        didValidatePhoneCalled = true
    }
}
