//
//  RegistrationPersonalDataViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class RegistrationPersonalDataViewController: UIViewController {
	private var viewModel: RegistrationViewModel = RegistrationViewModel()
	private lazy var titleLabel: UILabel = self.initTitle()
	private lazy var logo: UIImageView = self.initLogo()
	private lazy var nameTextField: UITextField = self.initTextField(image: UIImage(named: "user")!, placeholder: self.viewModel.name, isInputSecured: false)
	private lazy var surnameTextField: UITextField = self.initTextField(image: UIImage(named: "user")!, placeholder: self.viewModel.surname, isInputSecured: false)
	private lazy var personalCodeTextField: UITextField = self.initTextField(image: UIImage(named: "password")!, placeholder: self.viewModel.personalCode, isInputSecured: false)
	private lazy var documentNumberTextField: UITextField = self.initTextField(image: UIImage(named: "passport")!, placeholder: self.viewModel.documentNumber, isInputSecured: false)
	private lazy var returnArrowImage: UIImageView = self.initArrowImage()
	private lazy var loginButton: UIButton = self.initLoginButton()
	private lazy var loginLink: UILabel = self.initLoginLinkLabel()
	private var email: String?
	private var password: String?
	
	public init (viewModel: RegistrationViewModel, email: String?, password: String?) {
		self.viewModel = viewModel
		self.email = email
		self.password = password
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
		
		self.view.addSubview(self.returnArrowImage)
		self.activateBackArrowConstraints()
		self.view.addSubview(self.titleLabel)
		self.activateTitleConstraints()
		self.view.addSubview(self.logo)
		self.activateIconConstraints()
		self.view.addSubview(self.nameTextField)
		self.activateNameFieldConstraints()
		self.view.addSubview(self.surnameTextField)
		self.activateSurnameFieldConstraints()
		self.view.addSubview(self.personalCodeTextField)
		self.activatePersonalCodeFieldConstraints()
		self.view.addSubview(self.documentNumberTextField)
		self.activateDocumentNumberFieldConstraints()
		self.view.addSubview(self.loginButton)
		self.activateButtonConstraints()
		self.view.addSubview(self.loginLink)
		self.activateLoginTextConstraints()
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func keyboardWillShow(sender: NSNotification) {
		self.view.frame.origin.y = -250
	}
	
	@objc func keyboardWillHide(sender: NSNotification) {
		self.view.frame.origin.y = 0
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	@objc private func loadLoginScreen() {
		let newVC = LoginViewController()
		self.navigationController?.setViewControllers([newVC], animated: true)
	}
	
	@objc private func loadLoginScreenAfterValidation() {
		if self.viewModel.checkPersonalDataValidFields(name: self.nameTextField, surname: self.surnameTextField, personalCode: self.personalCodeTextField, documentNumber: self.documentNumberTextField) == true {
			self.viewModel.registerToService(emailText: self.email, passwordText: self.password, nameText: self.nameTextField.text, surnameText: self.surnameTextField.text, personalCodeText: self.personalCodeTextField.text, documentNumberText: self.documentNumberTextField.text, completion: {
				result in
				if result {
					let alert = self.initSuccessAlert()
					self.present(alert, animated: true, completion: nil)
				} else {
					let alert = self.initUnsuccessAlert()
					self.present(alert, animated: true, completion: nil)
				}
			})
		}
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
}

extension RegistrationPersonalDataViewController {
	private func initTitle() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.title
		label.font = UIFont(name: "seguisym", size: 70.0)
		label.font = label.font.withSize(70.0)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initLogo() -> UIImageView {
		let image = #imageLiteral(resourceName: "SplashScreenIcon")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		return imageView
	}
	
	private func initTextField(image: UIImage, placeholder: String, isInputSecured: Bool) -> UITextField {
		let textField = UITextField()
		textField.placeholder = placeholder
		textField.translatesAutoresizingMaskIntoConstraints = false
		let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 55, height: 55))
		imageView.image = image
		let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
		view.addSubview(imageView)
		textField.leftView = view
		textField.leftViewMode = .always
		textField.textColor = UIColor(named: "ButtonColor")
		textField.borderStyle = .roundedRect
		textField.layer.borderColor = UIColor(named: "ButtonColor")?.cgColor
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [21, 28, 35]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
		textField.isSecureTextEntry = isInputSecured
		return textField
	}
	
	private func initArrowImage() -> UIImageView {
		let image = #imageLiteral(resourceName: "returnArrow").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = UIColor(named: "ButtonColor")
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnToPreviousScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
	
	private func initLoginButton() -> UIButton {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.backgroundColor = UIColor(named: "ButtonColor")
		button.layer.cornerRadius = 30
		button.tintColor = .white
		button.addTarget(self, action: #selector(self.loadLoginScreenAfterValidation), for: .touchUpInside)
		return button
	}
	
	private func initLoginLinkLabel() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.loginHereTitle
		label.font = UIFont(name: "seguisym", size: 15.0)
		label.font = label.font.withSize(15.0)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.sizeToFit()
		label.numberOfLines = 2
		label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.loadLoginScreen)))
		label.isUserInteractionEnabled = true
		return label
	}
	
	private func initSuccessAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.successfulRegistration, message: self.viewModel.successfulRegistrationSubtitle, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.login, style: .default, handler: {
			(action) -> Void in
			self.navigationController?.setViewControllers([LoginViewController()], animated: true)
		})
		alert.addAction(action)
		return alert
	}
	
	private func initUnsuccessAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.unsuccessfulRegistration, message: self.viewModel.unsuccessfulRegistrationMessage, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.tryAgain, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
}

extension RegistrationPersonalDataViewController {
	private func activateBackArrowConstraints() {
		NSLayoutConstraint.activate([
			self.returnArrowImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
			self.returnArrowImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.returnArrowImage.heightAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0])),
			self.returnArrowImage.widthAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0]))
		])
	}
	
	private func activateTitleConstraints() {
		NSLayoutConstraint.activate([
			self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [37.5, 50, 62.5])),
			self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.logo.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: UIView.margin(of: [9.5, 13.0, 16])),
			self.logo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [75, 100, 125])),
			self.logo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [75, 100, 125])),
			self.logo.heightAnchor.constraint(equalToConstant: 100)
		])
	}
	
	private func activateNameFieldConstraints() {
		NSLayoutConstraint.activate([
			self.nameTextField.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: UIView.margin(of: [13.5, 18.0, 22.5])),
			self.nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.nameTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activateSurnameFieldConstraints() {
		NSLayoutConstraint.activate([
			self.surnameTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: UIView.margin(of: [5.5, 6.5, 7.5])),
			self.surnameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.surnameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.surnameTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activatePersonalCodeFieldConstraints() {
		NSLayoutConstraint.activate([
			self.personalCodeTextField.topAnchor.constraint(equalTo: self.surnameTextField.bottomAnchor, constant: UIView.margin(of: [5.5, 6.5, 7.5])),
			self.personalCodeTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.personalCodeTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.personalCodeTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activateDocumentNumberFieldConstraints() {
		NSLayoutConstraint.activate([
			self.documentNumberTextField.topAnchor.constraint(equalTo: self.personalCodeTextField.bottomAnchor, constant: UIView.margin(of: [5.5, 6.5, 7.5])),
			self.documentNumberTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.documentNumberTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.documentNumberTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.loginButton.topAnchor.constraint(equalTo: self.documentNumberTextField.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 75])),
			self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 75])),
			self.loginButton.heightAnchor.constraint(equalToConstant: UIView.margin(of:[37.5, 50, 62.5]))
		])
	}
	
	private func activateLoginTextConstraints() {
		NSLayoutConstraint.activate([
			self.loginLink.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.loginLink.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.loginLink.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.loginLink.heightAnchor.constraint(equalToConstant: 55.0)
		])
	}
}
