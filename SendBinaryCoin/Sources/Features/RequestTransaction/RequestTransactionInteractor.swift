//
//  RequestTransactionInteractor.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

final class RequestTransactionInteractor {
    
    // MARK: - VIPER Properties

    weak var output: RequestTransactionInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let request: Network

    // MARK: - Inits
    
    init(request: Network) {
        self.request = request
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension RequestTransactionInteractor: RequestTransactionInteractorInputProtocol {

}
