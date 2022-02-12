//
//  RequestTransactionPresenter.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

final class RequestTransactionPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: RequestTransactionPresenterOutputProtocol?
    private let router: RequestTransactionRouterProtocol
    private let interactor: RequestTransactionInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(router: RequestTransactionRouterProtocol,
         interactor: RequestTransactionInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension RequestTransactionPresenter: RequestTransactionPresenterInputProtocol {
    func viewDidAppear() {
        trackScreenView()
    }
}

// MARK: - Output Protocol
extension RequestTransactionPresenter: RequestTransactionInteractorOutputProtocol {
    
}

// MARK: - Analytics
extension RequestTransactionPresenter {
    func trackScreenView() {
    }
}
