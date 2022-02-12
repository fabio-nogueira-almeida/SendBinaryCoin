//
//  RequestTransactionRouter.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import UIKit

final class RequestTransactionRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?

    // MARK: - Private

    private func setupModule() -> UIViewController {
        let configurator = RequestTransactionConfigurator()
        let view = configurator.createModule()
        viewController = view
        return view
    }
}

// MARK: - Router Protocol
extension RequestTransactionRouter: RequestTransactionRouterProtocol {
    func start() -> UIViewController {
        return setupModule()
    }
}
