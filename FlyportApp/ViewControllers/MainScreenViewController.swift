//
//  MainScreenViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-01.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
	private var viewModel = MainScreenViewModel()
	private lazy var flyportTitle: UILabel = self.initTitle(text: self.viewModel.flyportLabelTitle, fontSize: 70.0)
	private lazy var flyportSubtitle: UILabel = self.initTitle(text: self.viewModel.flyportSubtitleText, fontSize: 20.0)
	private lazy var icon: UIImageView = self.initFlyportMainScreenIcon()
	private lazy var loginButton: UIButton = self.initButton(text: self.viewModel.loginTitle)
	private lazy var registerButton: UIButton = self.initButton(text: self.viewModel.registerTitle)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true

		self.view.addSubview(flyportTitle)
		self.activateTitleConstraints()
		self.view.addSubview(flyportSubtitle)
		self.activateSubtitleConstraints()
		self.view.addSubview(icon)
		self.activateIconConstraints()
		self.view.addSubview(loginButton)
		loginButton.addTarget(self, action: #selector(self.loadLoginScreen), for: .touchUpInside)
		self.activateLoginButtonConstraints()
		self.view.addSubview(registerButton)
		self.activateRegisterButtonConstraints()
	}
}

extension MainScreenViewController {
	private func initTitle(text: String, fontSize: CGFloat) -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont(name: "seguisym", size: fontSize)
		label.font = label.font.withSize(fontSize)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initFlyportMainScreenIcon() -> UIImageView {
		let image = #imageLiteral(resourceName: "mainScreenIcon")
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 242, height: 242)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initButton(text: String) -> UIButton {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(text, for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(named: "ButtonColor")
		button.layer.cornerRadius = 8.0
		return button
	}
}

extension MainScreenViewController {
	private func activateTitleConstraints() {
		NSLayoutConstraint.activate([
			self.flyportTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [37.5, 50, 62.5])),
			self.flyportTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flyportTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateSubtitleConstraints() {
		NSLayoutConstraint.activate([
			self.flyportSubtitle.topAnchor.constraint(equalTo: self.flyportTitle.bottomAnchor, constant: UIView.margin(of: [24, 32, 40])),
			self.flyportSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flyportSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.icon.topAnchor.constraint(equalTo: self.flyportSubtitle.bottomAnchor, constant: UIView.margin(of: [56.5, 75, 93.6])),
			self.icon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.icon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateLoginButtonConstraints() {
		NSLayoutConstraint.activate([
			self.loginButton.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: UIView.margin(of: [45, 61, 76])),
			self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.loginButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [31,41,51]))
		])
	}
	
	private func activateRegisterButtonConstraints() {
		NSLayoutConstraint.activate([
			self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: UIView.margin(of: [31.5, 42, 52.5])),
			self.registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.registerButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [31,41,51]))
		])
	}
}

extension MainScreenViewController {
	@objc private func loadLoginScreen() {
		let newVC = LoginViewController()
		self.navigationController?.setViewControllers([newVC], animated: true)
	}
}
