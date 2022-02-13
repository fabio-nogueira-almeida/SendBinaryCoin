//
//  RequestTransactionProtocols.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import UIKit

// MARK: - ViewController
protocol RequestTransactionPresenterOutputProtocol: AnyObject {
    func set(title: String)
    func set(data: RequestTransactionViewData)
    func didConvertCoin(value: String)
    func didFindExchangeRate(value: String)
    func didValidatePhone(isValid: Bool)
}

// MARK: - Presenter
protocol RequestTransactionPresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
    func didSelect(country: Country)
    func didAddNew(coin: String)
    func didAddNew(phone: String)
}

// MARK: - Interactor
protocol RequestTransactionInteractorInputProtocol: AnyObject {
    func fetchData()
    func findExchangeRate(for: Country)
    func convert(coin: String)
    func shouldValidate(phone: String)
}

protocol RequestTransactionInteractorOutputProtocol: AnyObject {
    func fetchDataSuccess(viewData: RequestTransactionViewData)
    func didFindExchangeRate(value: String)
    func didConvertCoin(value: String)
    func didValidatePhone(isValid: Bool)
}

// MARK: - Router
protocol RequestTransactionRouterProtocol: AnyObject {
    func start() -> UIViewController
}
