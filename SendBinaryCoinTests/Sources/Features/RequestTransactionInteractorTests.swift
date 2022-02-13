//
//  RequestTransactionInteractorTests.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 13/02/22.
//

import XCTest
@testable import SendBinaryCoin


final class NetworkRequestMock: NetworkRequestProtocol {
    var components: URLComponents

    init() {
        components = URLComponents()
    }
}

final class RequestTransactionInteractorTests: XCTestCase {
    private let presenterSpy = RequestTransactionInteractorOutputProtocolSpy()
    private let requestMock = NetworkRequestMock()
    private var sut: RequestTransactionInteractor?

    override func setUp() {
        sut = RequestTransactionInteractor(request: requestMock)
        sut?.output = presenterSpy
        sut?.rates = RateResponse(rates: ["BR": 2])
    }

    // MARK: - Input

    func test_shouldTest_fetchData_flow() {
        sut?.fetchData()
        XCTAssertTrue(presenterSpy.fetchDataSuccessCalled)
    }

    func test_shouldTest_findExchangeRate_with_success_flow() {
        sut?.findExchangeRate(for: .init(name: "Brazil", currency: "BR", phonePrefix: "+55", phoneQtd: 4))
        XCTAssertTrue(presenterSpy.didFindExchangeRateCalled)
    }

    func test_shouldTest_not_findExchangeRate_flow() {
        sut?.findExchangeRate(for: .mock)
        XCTAssertFalse(presenterSpy.didFindExchangeRateCalled)
    }

    func test_shouldTest_convert_flow() {
        sut?.findExchangeRate(for: .init(name: "Brazil", currency: "BR", phonePrefix: "+55", phoneQtd: 4))
        sut?.convert(coin: "10")
        XCTAssertTrue(presenterSpy.didConvertCoinCalled)
        XCTAssertEqual(presenterSpy.coinConverted, "100")
    }

    func test_shouldTest_validate_phone_flow() {
        sut?.findExchangeRate(for: .init(name: "Brazil", currency: "BR", phonePrefix: "+55", phoneQtd: 4))
        sut?.shouldValidate(phone: "+551234")
        XCTAssertTrue(presenterSpy.didValidatePhoneCalled)
        XCTAssertTrue(presenterSpy.isValidatePhone)
    }

    func test_shouldTest_not_validate_phone_flow() {
        sut?.findExchangeRate(for: .init(name: "Brazil", currency: "BR", phonePrefix: "+55", phoneQtd: 4))
        sut?.shouldValidate(phone: "+551234567890")
        XCTAssertTrue(presenterSpy.didValidatePhoneCalled)
        XCTAssertFalse(presenterSpy.isValidatePhone)
    }

    // MARK: - User Case

}
