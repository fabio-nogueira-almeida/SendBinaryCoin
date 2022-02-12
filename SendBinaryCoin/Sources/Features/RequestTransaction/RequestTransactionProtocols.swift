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
}

// MARK: - Presenter
protocol RequestTransactionPresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
}

// MARK: - Interactor
protocol RequestTransactionInteractorInputProtocol: AnyObject {
    
}

protocol RequestTransactionInteractorOutputProtocol: AnyObject {
    
}

// MARK: - Router
protocol RequestTransactionRouterProtocol: AnyObject {
    func start() -> UIViewController
}
