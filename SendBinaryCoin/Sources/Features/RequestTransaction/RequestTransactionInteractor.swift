//
//  RequestTransactionInteractor.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Darwin

final class RequestTransactionInteractor {
    
    // MARK: - VIPER Properties

    weak var output: RequestTransactionInteractorOutputProtocol?

    private let request: NetworkRequestProtocol

    // MARK: - Private Properties
    
    private lazy var network = Network()
    private lazy var countries = CountryDataSource.generateData()

    var rates: RateResponse?

    private var countrySelected: Country?
    private var exchangeRateSelected: Float?

    // MARK: - Inits
    
    init(request: NetworkRequestProtocol) {
        self.request = request
    }

    // MARK: - Internal Methods

    private func createViewData() -> RequestTransactionViewData {
        return RequestTransactionViewData(countries: countries)
    }

    private func roundToOnlyTwoDecimal(value: Float) -> Float {
        round(value * 100) / 100.0
    }
    
    // MARK: - Private Methods

    func fetchRates() {
        guard let url = request.components.url else {
            return
        }
        network.request(url: url, response: RateResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.rates = response as? RateResponse
            case .failure(_): break
            }
        }
    }
}

// MARK: - Input Protocol
extension RequestTransactionInteractor: RequestTransactionInteractorInputProtocol {
    func fetchData() {
        fetchRates()
        output?.fetchDataSuccess(viewData: createViewData())
    }

    func findExchangeRate(for country: Country) {
        countrySelected = country
        exchangeRateSelected = rates?.rates[country.currency]
        if let exchangeRateSelected = exchangeRateSelected {
            let rateRounded = roundToOnlyTwoDecimal(value: exchangeRateSelected)
            output?.didFindExchangeRate(value: String(rateRounded))
        }
    }

    func convert(coin: String) {
        guard let binaryInDecimal = Exchange.decimal(from: coin),
              let exchangeRate = exchangeRateSelected else {
                  return
              }

        let rateRounded = roundToOnlyTwoDecimal(value: exchangeRate)
        let totalInReceiveCoin = Float(binaryInDecimal) * rateRounded
        let totalInBinary = Exchange.binary(from: Int(totalInReceiveCoin))
        output?.didConvertCoin(value: totalInBinary)
    }

    func shouldValidate(phone: String) {
        guard let countryPrefix = countrySelected?.phonePrefix,
        let countryPhoneNumbers = countrySelected?.phoneQtd else {
            output?.didValidatePhone(isValid: false)
            return
        }

        let isValid = phone.hasPrefix(countryPrefix) && phone.count ==  countryPhoneNumbers + countryPrefix.count
        output?.didValidatePhone(isValid: isValid)
    }
}
