//
//  LoginViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
	private var viewModel: LoginViewModel = LoginViewModel()
	private lazy var appTitle: UILabel = self.initAppTitle()
	private lazy var icon: UIImageView = self.initIcon()
	private lazy var emailTextField: UITextField = self.initEmailTextField()
	private lazy var passwordTextField: UITextField = self.initPasswordTextField()
	private lazy var loginButton: UIButton = self.initLoginButton()
	private lazy var registerTitle: UILabel = self.initRegisterTitle()
	private lazy var loginAlert: UIAlertController = self.initAlert()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
		
		self.view.addSubview(self.appTitle)
		self.activateTitleConstraints()
		self.view.addSubview(self.icon)
		self.activateIconConstraints()
		self.view.addSubview(self.emailTextField)
		self.activateEmailFieldConstraints()
		self.view.addSubview(self.passwordTextField)
		self.activatePasswordFieldConstraints()
		self.view.addSubview(self.loginButton)
		self.activateButtonConstraints()
		self.view.addSubview(self.registerTitle)
		self.activateRegisterTextConstraints()
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func keyboardWillShow(sender: NSNotification) {
		self.view.frame.origin.y = -300
	}
	
	@objc func keyboardWillHide(sender: NSNotification) {
		self.view.frame.origin.y = 0
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	@objc private func loadProfileScreen() {
		
		if self.viewModel.checkForAllValidFields(emailField: self.emailTextField, passwordField: self.passwordTextField) == true {
			self.viewModel.loginToService(emailText: self.emailTextField.text, passwordText: self.passwordTextField.text, completion: {
				result in
				if result {
					self.viewModel.getUserProfileData(completion: {
						profileResult in
						if profileResult {
							let vc  = HomeScreenViewController()
							vc.modalPresentationStyle = .fullScreen
							self.present(vc, animated: true, completion: nil)
						} else {
							self.present(self.loginAlert, animated: true, completion: nil)
						}
					})
				} else {
					self.present(self.loginAlert, animated: true, completion: nil)
				}
			})
		}
	}
	
	@objc private func loadRegisterScreen() {
		let newVC = RegistrationViewController()
		self.navigationController?.setViewControllers([newVC], animated: true)
	}
}

extension LoginViewController {
	private func initAppTitle() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.appTitle
		label.font = UIFont(name: "seguisym", size: 70.0)
		label.font = label.font.withSize(70.0)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initIcon() -> UIImageView {
		let image = #imageLiteral(resourceName: "Luggage")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initEmailTextField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = self.viewModel.email
		textField.translatesAutoresizingMaskIntoConstraints = false
		let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 55, height: 55))
		imageView.image = #imageLiteral(resourceName: "email")
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
		return textField
	}
	
	private func initPasswordTextField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = self.viewModel.password
		textField.translatesAutoresizingMaskIntoConstraints = false
		let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 55, height: 55))
		imageView.image = #imageLiteral(resourceName: "password")
		let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
		view.addSubview(imageView)
		textField.leftView = view
		textField.leftViewMode = .always
		textField.textColor = UIColor(named: "ButtonColor")
		textField.borderStyle = .roundedRect
		textField.layer.borderColor = UIColor(named: "ButtonColor")?.cgColor
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [21, 28, 35]))
		textField.layer.cornerRadius = 8.0
		textField.layer.borderWidth = 2
		//textField.isSecureTextEntry = true
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
		button.addTarget(self, action: #selector(self.loadProfileScreen), for: .touchUpInside)
		return button
	}
	
	private func initRegisterTitle() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.registerTitle
		label.font = UIFont(name: "seguisym", size: 17.0)
		label.font = label.font.withSize(17.0)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.loadRegisterScreen)))
		label.isUserInteractionEnabled = true
		return label
	}
	
	private func initAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.unsuccessfulLogin, message: self.viewModel.unsuccessfulLoginMessage, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.tryAgain, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
}

extension LoginViewController {
	private func activateTitleConstraints() {
		NSLayoutConstraint.activate([
			self.appTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [37.5, 50, 62.5])),
			self.appTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.appTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.icon.topAnchor.constraint(equalTo: self.appTitle.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.icon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.icon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.icon.heightAnchor.constraint(equalToConstant: 166.0)
		])
	}
	
	private func activateEmailFieldConstraints() {
		NSLayoutConstraint.activate([
			self.emailTextField.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.emailTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activatePasswordFieldConstraints() {
		NSLayoutConstraint.activate([
			self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.passwordTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: UIView.margin(of: [27, 39.0, 48])),
			self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 75])),
			self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 75])),
			self.loginButton.heightAnchor.constraint(equalToConstant: UIView.margin(of:[7.5, 50, 62.5]))
		])
	}
	
	private func activateRegisterTextConstraints() {
		NSLayoutConstraint.activate([
			self.registerTitle.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: UIView.margin(of: [22.5, 30.0, 37.5])),
			self.registerTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.registerTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
}
