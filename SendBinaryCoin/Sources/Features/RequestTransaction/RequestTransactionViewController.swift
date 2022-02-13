//
//  RequestTransactionViewController.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import UIKit

final class RequestTransactionViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: RequestTransactionPresenterInputProtocol

    // MARK: - Private Properties

    private var containerView = RequestTransactionView()

    // MARK: - Inits
    
    init(presenter: RequestTransactionPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods

    func setupView() {
        containerView.delegate = self
        view = containerView
    }
    
    // MARK: - Actions
}

// MARK: - Presenter Output Protocol
extension RequestTransactionViewController: RequestTransactionPresenterOutputProtocol {
    func set(title: String) {
        navigationController?.title = title
    }

    func set(data: RequestTransactionViewData) {
        containerView.set(viewData: data)
    }

    func didConvertCoin(value: String) {
        containerView.reloadReceiveCoin(value: value)
    }

    func didFindExchangeRate(value: String) {
        containerView.set(exchangeRate: value)
    }

    func didValidatePhone(isValid: Bool) {
        if !isValid {
            let alertViewController = UIAlertController(title: RequestTransactionViewStrings.phoneInvalid,
                                                        message: nil,
                                                        preferredStyle: .alert)

            let action = UIAlertAction(title: RequestTransactionViewStrings.phoneOkButton, style: .default) { _ in }
            alertViewController.addAction(action)

            self.present(alertViewController, animated: true, completion: nil)
        }
    }
}

// MARK: - RequestTransactionViewDelegate

extension RequestTransactionViewController: RequestTransactionViewDelegate {
    func didSendRequest() {
        let alertViewController = UIAlertController(title: RequestTransactionViewStrings.successMessage,
                                                    message: nil,
                                                    preferredStyle: .alert)

        let action = UIAlertAction(title: RequestTransactionViewStrings.phoneOkButton, style: .default) { _ in }
        alertViewController.addAction(action)

        self.present(alertViewController, animated: true, completion: nil)
    }

    func didEnter(country: Country) {
        presenter.didSelect(country: country)
    }

    func didEnter(coin: String) {
        presenter.didAddNew(coin: coin)
    }

    func didEnter(phone: String) {
        presenter.didAddNew(phone: phone)
    }
}
