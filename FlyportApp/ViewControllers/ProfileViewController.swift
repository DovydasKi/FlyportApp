//
//  ProfileViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
	private let viewModel = ProfileViewModel()
	private lazy var userIcon: UIImageView = self.initIcon()
	private lazy var nameLabel: UILabel = self.initNameTitle()
	private lazy var emailTextField: UITextField = self.initEmailTextField()
	private lazy var documentTextField: UITextField = self.initDocumentTextField()
	private lazy var passwordField: UITextField = self.initPasswordField(placeholder: self.viewModel.password)
	private lazy var repeatPasswordTextField: UITextField = self.initPasswordField(placeholder: self.viewModel.repeatPassword)
	private lazy var saveButton: UIButton = self.initSaveButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.addSubview(self.nameLabel)
		self.activateNameLabelConstraints()
		self.view.addSubview(self.userIcon)
		self.activateIconConstraints()
		self.view.addSubview(self.emailTextField)
		self.activateEmailFieldConstraints()
		self.view.addSubview(self.documentTextField)
		self.activateDocumentFieldConstraints()
		self.view.addSubview(self.passwordField)
		self.activatePasswordFieldConstraints()
		self.view.addSubview(self.repeatPasswordTextField)
		self.activateRepeatPasswordFieldConstraints()
		self.view.addSubview(self.saveButton)
		self.activateButtonConstraints()
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func saveData() {
		let isDataCorrect = self.viewModel.checkValidation(email: self.emailTextField, document: self.documentTextField, password: self.passwordField, repeatPassword: self.repeatPasswordTextField)
		if isDataCorrect {
			self.viewModel.updateToService(document: self.documentTextField.text, email: self.emailTextField.text, password: self.passwordField.text, completion: {
				success in
				if success {
					self.viewModel.updateLocalData(document: self.documentTextField.text, email: self.emailTextField.text, password: self.passwordField.text)
					let alert = self.initSuccessAlert()
					self.present(alert, animated: true, completion: nil)
				} else {
					let alert = self.initUnsuccessAlert()
					self.present(alert, animated: true, completion: nil)
				}
			})
		}
	}
	
	@objc func keyboardWillShow(sender: NSNotification) {
		self.view.frame.origin.y = -200
	}
	
	@objc func keyboardWillHide(sender: NSNotification) {
		self.view.frame.origin.y = 0
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}

extension ProfileViewController {
	private func initNameTitle() -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = viewModel.fullName
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [15,20,25]))
		label.font = label.font.withSize(UIView.margin(of: [15,20,25]))
		label.textColor = UIColor(named: "ButtonColor")
		label.textAlignment = .center
		label.setNeedsLayout()
		label.numberOfLines = 0
		return label
	}
	
	private func initIcon() -> UIImageView {
		let image = #imageLiteral(resourceName: "user")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initEmailTextField() -> UITextField {
		let textField = UITextField()
		textField.text = self.viewModel.userLoginInfo.email
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
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [15,20,25]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
		return textField
	}
	
	private func initDocumentTextField() -> UITextField {
		let textField = UITextField()
		textField.text = self.viewModel.userPersonalInfo.documentNumber
		textField.translatesAutoresizingMaskIntoConstraints = false
		let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 55, height: 55))
		imageView.image = #imageLiteral(resourceName: "passport")
		let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
		view.addSubview(imageView)
		textField.leftView = view
		textField.leftViewMode = .always
		textField.textColor = UIColor(named: "ButtonColor")
		textField.borderStyle = .roundedRect
		textField.layer.borderColor = UIColor(named: "ButtonColor")?.cgColor
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [15,20,25]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
		return textField
	}
	
	private func initPasswordField(placeholder: String) -> UITextField {
		let textField = UITextField()
		textField.placeholder = placeholder
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
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [15,20,25]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
        textField.isSecureTextEntry = true
		return textField
	}
	
	private func initSaveButton() -> UIButton {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.backgroundColor = UIColor(named: "ButtonColor")
		button.layer.cornerRadius = 30
		button.tintColor = .white
		button.addTarget(self, action: #selector(self.saveData), for: .touchUpInside)
		return button
	}
	
	private func initSuccessAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.successfulUpdate, message: self.viewModel.successfulUpdateSubtitle, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.ok, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
	
	private func initUnsuccessAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.unsuccessfulUpdate, message: self.viewModel.unsuccessfulUpdateMessage, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.tryAgain, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
}

extension ProfileViewController {
	private func activateNameLabelConstraints() {
		NSLayoutConstraint.activate([
			self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.nameLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [38,50,55]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.userIcon.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.userIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.userIcon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [66, 88, 88])),
			self.userIcon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [66, 88, 88]))
		])
	}
	
	private func activateEmailFieldConstraints() {
		NSLayoutConstraint.activate([
			self.emailTextField.topAnchor.constraint(equalTo: self.userIcon.bottomAnchor, constant: UIView.margin(of: [30, 40, 40])),
			self.emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.emailTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activateDocumentFieldConstraints() {
		NSLayoutConstraint.activate([
			self.documentTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.documentTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.documentTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.documentTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activatePasswordFieldConstraints() {
		NSLayoutConstraint.activate([
			self.passwordField.topAnchor.constraint(equalTo: self.documentTextField.bottomAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.passwordField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activateRepeatPasswordFieldConstraints() {
		NSLayoutConstraint.activate([
			self.repeatPasswordTextField.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [16, 20, 24])),
			self.repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [16, 20, 24])),
			self.repeatPasswordTextField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [41,55,68.5]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.saveButton.topAnchor.constraint(equalTo: self.repeatPasswordTextField.bottomAnchor, constant: UIView.margin(of: [27, 39.0, 40])),
			self.saveButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 75])),
			self.saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 75])),
			self.saveButton.heightAnchor.constraint(equalToConstant: UIView.margin(of:[7.5, 50, 62.5]))
		])
	}
}
