//
//  RequestTransactionPresenterTests.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 13/02/22.
//

import XCTest
@testable import SendBinaryCoin

final class RequestTransactionPresenterTests: XCTestCase {
    private lazy var sut = RequestTransactionPresenter(router: routerSpy,
                                                              interactor: interactorSpy)
    private let interactorSpy = RequestTransactionInteractorInputProtocolSpy()
    private let routerSpy = RequestTransactionRouterProtocolSpy()
    private let viewContollerSpy = RequestTransactionPresenterOutputProtocolSpy()

    override func setUp() {
        super.setUp()
        sut.viewController = viewContollerSpy
    }

    // MARK: - Input

    func test_shouldTest_viewDidLoad_flow() {
        sut.viewDidLoad()
        XCTAssertTrue(viewContollerSpy.setTitleCalled)
        XCTAssertTrue(interactorSpy.fetchDataCalled)
    }

    func test_shouldTest_didSelect_flow() {
        sut.didSelect(country: .mock)
        XCTAssertTrue(interactorSpy.findExchangeRateCalled)
    }

    func test_shouldTest_didAddNew_coint_flow() {
        sut.didAddNew(coin: "11")
        XCTAssertTrue(interactorSpy.convertCalled)
    }

    func test_shouldTest_didAddNew_phone_flow() {
        sut.didAddNew(phone: "+55987187865")
        XCTAssertTrue(interactorSpy.shouldValidateCalled)
    }

    // MARK: - Output

    func test_shouldTest_fetchDataSuccess_flow() {
        sut.fetchDataSuccess(viewData: .mock)
        XCTAssertTrue(viewContollerSpy.setDataCalled)
    }

    func test_shouldTest_didFindExchangeRate_flow() {
        sut.didFindExchangeRate(value: "111")
        XCTAssertTrue(viewContollerSpy.didFindExchangeRateCalled)
    }

    func test_shouldTest_didValidatePhone_flow() {
        sut.didValidatePhone(isValid: true)
        XCTAssertTrue(viewContollerSpy.didValidatePhoneCalled)
    }

    func test_shouldTest_didConvertCoin_flow() {
        sut.didConvertCoin(value: "111")
        XCTAssertTrue(viewContollerSpy.didConvertCoinCalled)
    }
}
