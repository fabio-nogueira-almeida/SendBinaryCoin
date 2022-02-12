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

    // MARK: - Internal Properties

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
        self.view = containerView
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    
    // MARK: - Actions
}

// MARK: - Presenter Output Protocol
extension RequestTransactionViewController: RequestTransactionPresenterOutputProtocol {
    func set(title: String) {
        navigationController?.title = title
    }
}
