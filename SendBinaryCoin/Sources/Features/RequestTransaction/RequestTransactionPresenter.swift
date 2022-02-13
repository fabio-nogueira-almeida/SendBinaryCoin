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
    func didSelect(country: Country) {
        interactor.findExchangeRate(for: country)
    }

    func didAddNew(coin: String) {
        interactor.convert(coin: coin)
    }

    func didAddNew(phone: String) {
        interactor.shouldValidate(phone: phone)
    }

    func viewDidAppear() {
        trackScreenView()
    }
}

// MARK: - Output Protocol
extension RequestTransactionPresenter: RequestTransactionInteractorOutputProtocol {
    func viewDidLoad() {
        viewController?.set(title: RequestTransactionViewStrings.navigationTitle)
        interactor.fetchData()
    }

    func fetchDataSuccess(viewData: RequestTransactionViewData) {
        viewController?.set(data: viewData)
    }

    func didFindExchangeRate(value: String) {
        viewController?.didFindExchangeRate(value: value)
    }

    func didConvertCoin(value: String) {
        viewController?.didConvertCoin(value: value)
    }

    func didValidatePhone(isValid: Bool) {
        viewController?.didValidatePhone(isValid: isValid)
    }
}

// MARK: - Analytics
extension RequestTransactionPresenter {
    func trackScreenView() {
    }
}
