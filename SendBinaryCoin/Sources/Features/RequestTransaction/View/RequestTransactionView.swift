//
//  RequestTransactionView.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation
import UIKit

final class RequestTransactionView: UIView {

    // MARK: - Properties

    let defaultSpacing = 12.0

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
        return view
    }()

    private(set) lazy var rateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = RequestTransactionViewStrings.rateDescription
        view.textAlignment = .center
        return view
    }()

    private(set) lazy var sendButton: UIButton = {
        let view = UIButton(type: .roundedRect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle(RequestTransactionViewStrings.sendButton, for: .normal)
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
}


// MARK: - View Code

extension RequestTransactionView: ViewCode {
    func buildViewHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(countryTextField)

        mainStackView.addArrangedSubview(nameTextField)
        mainStackView.addArrangedSubview(lastNameTextField)

        mainStackView.addArrangedSubview(sendCoinTextField)
        mainStackView.addArrangedSubview(receiveCoinTextField)

        mainStackView.addArrangedSubview(rateLabel)
        mainStackView.addArrangedSubview(sendButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultSpacing),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -defaultSpacing),
            mainStackView.heightAnchor.constraint(equalToConstant: 300)
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

        sendCoinTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: defaultSpacing).isActive = true
        receiveCoinTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -defaultSpacing).isActive = true
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
