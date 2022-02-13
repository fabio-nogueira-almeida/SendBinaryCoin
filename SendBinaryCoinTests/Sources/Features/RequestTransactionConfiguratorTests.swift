//
//  RequestTransactionConfiguratorTests.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 13/02/22.
//

import XCTest
@testable import SendBinaryCoin

final class RequestTransactionConfiguratorTests: XCTestCase {
        
    private let sut = RequestTransactionConfigurator()

    func test_create_module() {
        let viewController = sut.createModule()

        XCTAssertTrue(viewController is RequestTransactionViewController)
        let viewControllerMirrored = Mirror(reflecting: viewController)

        guard let presenter = viewControllerMirrored.firstChild(of: RequestTransactionPresenter.self) else {
            return XCTFail("Unexpected nil in presenter reference")
        }

        let presenterMirrored = Mirror(reflecting: presenter)
        XCTAssertNotNil(presenterMirrored.firstChild(of: RequestTransactionRouterProtocol.self))
        XCTAssertNotNil(presenter.viewController)
        guard let interactor = presenterMirrored.firstChild(of: RequestTransactionInteractor.self) else {
            return XCTFail("Unexpected nil in interactor reference")
        }
        XCTAssertNotNil(interactor.output)
    }
}
