//
//  RequestTransactionViewDelegateSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

final class RequestTransactionViewSpy: RequestTransactionViewProtocol,
                                       RequestTransactionViewDelegate {
    var delegate: RequestTransactionViewDelegate?

    private(set) var setViewDataCalled = false
    private(set) var setRecipientValueCalled = false
    private(set) var reloadReceiveCoin = false
    private(set) var setExchangeRateCalled = false

    private(set) var didEnterCalled = false
    private(set) var didEnterCoinCalled = false
    private(set) var didEnterPhoneCalled = false
    private(set) var didSendRequestCalled = false

    // MARK: - RequestTransactionViewProtocol

    func set(viewData: RequestTransactionViewData) {
        setViewDataCalled = true
    }

    func set(recipientValue: String) {
        setRecipientValueCalled = true
    }

    func reloadReceiveCoin(value: String) {
        reloadReceiveCoin = true
    }

    func set(exchangeRate: String) {
        setExchangeRateCalled = true
    }

    // MARK: - RequestTransactionViewDelegate

    func didEnter(country: Country) {
        didEnterCalled = true
    }

    func didEnter(coin: String) {
        didEnterCoinCalled = true
    }

    func didEnter(phone: String) {
        didEnterPhoneCalled = true
    }

    func didSendRequest() {
        didSendRequestCalled = true
    }
}
