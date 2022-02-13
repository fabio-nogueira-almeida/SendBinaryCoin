//
//  RequestTransactionPresenterInputSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
@testable import SendBinaryCoin

final class RequestTransactionPresenterInputSpy: RequestTransactionPresenterInputProtocol {

    private(set) var viewDidLoadCalled = false
    private(set) var viewDidAppearCalled = false
    private(set) var didSelectCalled = false
    private(set) var didAddNewCoinCalled = false
    private(set) var didAddNewPhoneCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    func viewDidAppear() {
        viewDidAppearCalled = true
    }

    func didSelect(country: Country) {
        didSelectCalled = true
    }

    func didAddNew(coin: String) {
        didAddNewCoinCalled = true
    }

    func didAddNew(phone: String) {
        didAddNewPhoneCalled = true
    }
}
