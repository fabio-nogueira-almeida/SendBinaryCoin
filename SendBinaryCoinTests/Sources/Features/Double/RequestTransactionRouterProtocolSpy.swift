//
//  RequestTransactionRouterProtocolSpy.swift
//  SendBinaryCoinTests
//
//  Created by Fabio Nogueira on 13/02/22.
//

import Foundation
import UIKit
@testable import SendBinaryCoin

final class RequestTransactionRouterProtocolSpy: RequestTransactionRouterProtocol {

    private(set) var startCalled = false

    func start() -> UIViewController {
        startCalled = true
        return UIViewController()
    }
}
