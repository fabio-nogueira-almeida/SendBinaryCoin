//
//  RequestTransactionProtocols.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

// MARK: - ViewController
protocol RequestTransactionPresenterOutputProtocol: AnyObject {
    
}

// MARK: - Presenter
protocol RequestTransactionPresenterInputProtocol: AnyObject {
    func viewDidAppear()
}

// MARK: - Interactor
protocol RequestTransactionInteractorInputProtocol: AnyObject {
    
}

protocol RequestTransactionInteractorOutputProtocol: AnyObject {
    
}

// MARK: - Router
protocol RequestTransactionRouterProtocol: AnyObject {

}
