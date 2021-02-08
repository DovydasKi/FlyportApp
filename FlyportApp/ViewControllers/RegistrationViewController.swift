//
//  RegistrationViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-03.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
	private let viewModel: RegistrationViewModel = RegistrationViewModel()
	private lazy var titleLabel: UILabel = self.initTitle()
	private lazy var logo: UIImageView = self.initLogo()
	private lazy var emailTextField: UITextField = self.initTextField(image: UIImage(named: "email")!, placeholder: self.viewModel.email, isInputSecured: false)
	private lazy var passwordTextField: UITextField = self.initTextField(image: UIImage(named: "password")!, placeholder: self.viewModel.password, isInputSecured: true)
	private lazy var repeatPasswordTextField: UITextField = self.initTextField(image: UIImage(named: "password")!, placeholder: self.viewModel.repeatPassword, isInputSecured: true)
	private lazy var loginButton: UIButton = self.initLoginButton()
	private lazy var loginLink: UILabel = self.initLoginLinkLabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
		
		self.view.addSubview(self.titleLabel)
		self.activateTitleConstraints()
		self.view.addSubview(self.logo)
		self.activateIconConstraints()
		self.view.addSubview(self.emailTextField)
		self.activateEmailFieldConstraints()
		self.view.addSubview(self.passwordTextField)
		self.activatePasswordFieldConstraints()
		self.view.addSubview(self.repeatPasswordTextField)
		self.activateRepeatPasswordFieldConstraints()
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
	
    @objc private func loadOtherRegistrationScreenAfterValidation() {
		if self.viewModel.checkForAllValidFields(emailField: self.emailTextField, passwordField: self.passwordTextField, repeatPasswordField: self.repeatPasswordTextField) == true {
			let newVC = RegistrationPersonalDataViewController(viewModel: self.viewModel, email: self.emailTextField.text, password: self.passwordTextField.text)
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
}

extension RegistrationViewController {
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
	
	private func initLoginButton() -> UIButton {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.backgroundColor = UIColor(named: "ButtonColor")
		button.layer.cornerRadius = 30
		button.tintColor = .white
		button.addTarget(self, action: #selector(self.loadOtherRegistrationScreenAfterValidation), for: .touchUpInside)
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
}

extension RegistrationViewController {
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
	
	private func activateEmailFieldConstraints() {
		NSLayoutConstraint.activate([
			self.emailTextField.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: UIView.margin(of: [13.5, 18.0, 22.5])),
			self.emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.emailTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activatePasswordFieldConstraints() {
		NSLayoutConstraint.activate([
			self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: UIView.margin(of: [5.5, 6.5, 7.5])),
			self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.passwordTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activateRepeatPasswordFieldConstraints() {
		NSLayoutConstraint.activate([
			self.repeatPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: UIView.margin(of: [5.5, 6.5, 7.5])),
			self.repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.repeatPasswordTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37.5,50,62.5]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.loginButton.topAnchor.constraint(equalTo: self.repeatPasswordTextField.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
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
