//
//  RequestTransactionConfigurator.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import UIKit

public final class RequestTransactionConfigurator {
        
    public func createModule() -> UIViewController {
        let router = RequestTransactionRouter()
        let interactor = RequestTransactionInteractor(request: RateRequest())
        let presenter = RequestTransactionPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = RequestTransactionViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
