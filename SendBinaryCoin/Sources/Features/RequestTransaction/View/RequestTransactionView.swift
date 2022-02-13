//
//  RequestTransactionView.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation
import UIKit

protocol RequestTransactionViewDelegate: AnyObject {
    func didEnter(country: Country)
    func didEnter(coin: String)
    func didEnter(phone: String)
    func didSendRequest()
}

final class RequestTransactionView: UIView {

    // MARK: - Properties

    private var data: RequestTransactionViewData?
    private let defaultSpacing = 12.0
    private let pickerView = UIPickerView()

    private var countrySelected: Country? {
        didSet {
            if let countrySelected = countrySelected {
                delegate?.didEnter(country: countrySelected)
            }
        }
    }

    private var exchangeRate: String? {
        didSet {
            if let value = exchangeRate,
               let currency = countrySelected?.currency {
                rateLabel.text = String(format: RequestTransactionViewStrings.rateDescription, "\(value) \(currency)")
            }
        }
    }

    // MARK: - Public Properties

    weak var delegate: RequestTransactionViewDelegate?

    // MARK: - IBOutlets

    private(set) lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = defaultSpacing
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private(set) lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = RequestTransactionViewStrings.recipientTitle
        return view
    }()

    private(set) lazy var countryTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.country
        view.textAlignment = .center
        view.textColor = .systemOrange
        view.delegate = self
        return view
    }()

    private(set) lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.recipientName
        view.textAlignment = .center
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private(set) lazy var lastNameTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.recipientLastName
        view.textAlignment = .center
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private(set) lazy var phoneTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.recipientPhone
        view.textAlignment = .center
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private(set) lazy var sendCoinTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.youSend
        view.textAlignment = .center
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private(set) lazy var receiveCoinTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = RequestTransactionViewStrings.theyReceive
        view.textAlignment = .center
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.isEnabled = false
        return view
    }()

    private(set) lazy var rateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.text = " "
        return view
    }()

    private(set) lazy var sendButton: UIButton = {
        let view = UIButton(type: .roundedRect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle(RequestTransactionViewStrings.sendButton, for: .normal)
        view.addTarget(self, action: #selector(didTouchSendButton), for: .touchUpInside)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemOrange
        return view
    }()

    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func set(viewData: RequestTransactionViewData) {
        data = viewData
    }


    func set(recipientValue: String) {
        receiveCoinTextField.text = recipientValue
    }

    func reloadReceiveCoin(value: String) {
        if let currency = countrySelected?.currency {
            receiveCoinTextField.text = value + " \(currency)"
        }
    }

    func set(exchangeRate: String) {
        self.exchangeRate = exchangeRate
    }

    // MARK: Action

    @objc func didTouchSendButton() {
        delegate?.didSendRequest()
    }
}


// MARK: - View Code

extension RequestTransactionView: ViewCode {
    func buildViewHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(countryTextField)

        mainStackView.addArrangedSubview(nameTextField)
        mainStackView.addArrangedSubview(lastNameTextField)
        mainStackView.addArrangedSubview(phoneTextField)

        mainStackView.addArrangedSubview(sendCoinTextField)
        mainStackView.addArrangedSubview(receiveCoinTextField)

        mainStackView.addArrangedSubview(rateLabel)
        mainStackView.addArrangedSubview(sendButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultSpacing),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -defaultSpacing),
            mainStackView.heightAnchor.constraint(equalToConstant: 400)
        ])

        NSLayoutConstraint.activate([
            countryTextField.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: defaultSpacing)
        ])

        NSLayoutConstraint.activate([
            sendCoinTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing),
            sendCoinTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing),
        ])

        NSLayoutConstraint.activate([
            receiveCoinTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing),
            receiveCoinTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing),
        ])

        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing),
            nameTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing),
        ])

        NSLayoutConstraint.activate([
            lastNameTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing),
            lastNameTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing),
        ])

        NSLayoutConstraint.activate([
            phoneTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing),
            phoneTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing),
        ])

        sendCoinTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing).isActive = true
        receiveCoinTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing).isActive = true
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
        pickerView.delegate = self
        pickerView.dataSource = self
        sendCoinTextField.delegate = self
        phoneTextField.delegate = self
        countryTextField.inputView = pickerView
        countryTextField.becomeFirstResponder()
    }
}

// MARK: - UITextFieldDelegate

extension RequestTransactionView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && range.length == 1 {
            sendCoinTextField.text = ""
            receiveCoinTextField.text = ""
        } else if let value = textField.text, textField == sendCoinTextField {
            delegate?.didEnter(coin: value)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = textField.text, textField == phoneTextField {
            delegate?.didEnter(phone: value)
        }
    }
}

// MARK: - UIPickerViewDataSource

extension RequestTransactionView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.countries.count ?? 0
    }
}

// MARK: - UIPickerViewDelegate

extension RequestTransactionView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?.countries[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = data?.countries[row]
        countrySelected = country
        countryTextField.text = country?.name
    }
}
