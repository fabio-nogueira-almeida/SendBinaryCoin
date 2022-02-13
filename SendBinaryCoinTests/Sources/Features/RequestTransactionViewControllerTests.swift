//
//  RequestTransactionViewControllerTests.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 13/02/22.
//

import XCTest
import SnapshotTesting
@testable import SendBinaryCoin

final class RequestTransactionViewControllerTests: XCTestCase {
    private let presenterSpy = RequestTransactionPresenterInputSpy()
    private var sut: RequestTransactionViewController?
    private lazy var containerDelegateSpy = RequestTransactionViewSpy()

    override func setUp() {
        super.setUp()
        sut = RequestTransactionViewController(presenter: presenterSpy,
                                               containerView: containerDelegateSpy)
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut?.containerView.delegate = containerDelegateSpy
        sut?.loadView()
    }

    // MARK: - Snapshot

    func test_snapshot() {
        assertSnapshot(matching: sut!, as: .image)
    }

    // MARK: - Lifecycle

    func test_shouldTest_viewDidLoad_flow() {
        sut?.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }

    func test_shouldTest_viewDidAppear_flow() {
        sut?.viewDidAppear(true)
        XCTAssertTrue(presenterSpy.viewDidAppearCalled)
    }

    // MARK: - Output

    func test_shouldTest_setData_flow() {
        sut?.set(data: .mock)
        XCTAssertTrue(containerDelegateSpy.setViewDataCalled)
    }

    func test_shouldTest_didConvertCoin_flow() {
        sut?.didConvertCoin(value: "")
        XCTAssertTrue(containerDelegateSpy.reloadReceiveCoin)
    }

    func test_shouldTest_didFindExchangeRate_flow() {
        sut?.didFindExchangeRate(value: "")
        XCTAssertTrue(containerDelegateSpy.setExchangeRateCalled)
    }

    // MARK: - View Delegate

    func test_shouldTest_didEnter_country_flow() {
        sut?.didEnter(country: .mock)
        XCTAssertTrue(presenterSpy.didSelectCalled)
    }

    func test_shouldTest_didEnter_coin_flow() {
        sut?.didEnter(coin: "")
        XCTAssertTrue(presenterSpy.didAddNewCoinCalled)
    }

    func test_shouldTest_didEnter_phone_flow() {
        sut?.didEnter(phone: "")
        XCTAssertTrue(presenterSpy.didAddNewPhoneCalled)
    }
}
