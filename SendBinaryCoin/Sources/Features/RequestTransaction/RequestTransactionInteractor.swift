//
//  RequestTransactionInteractor.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import NetworkCore

final class RequestTransactionInteractor {
    
    // MARK: - VIPER Properties

    weak var output: RequestTransactionInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let request: <#NetworkCoreRequestable#>

    // MARK: - Inits
    
    init(request: <#NetworkCoreRequestable#>) {
        self.request = request
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension RequestTransactionInteractor: RequestTransactionInteractorInputProtocol {

}
