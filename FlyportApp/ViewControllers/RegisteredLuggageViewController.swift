//
//  RegisteredLuggageViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class RegisteredLuggageViewController: UIViewController {
	private let viewModel = RegisteredLuggageViewModel()
	private lazy var screenLabel: UILabel = self.initLabel()
	private lazy var iconView: UIImageView = self.initImageView()
	private lazy var yesButton: UIImageView = self.initYesButton()
	private lazy var noButton: UIImageView = self.initNoButton()
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.screenLabel)
		self.activateLabelConstraitns()
		self.view.addSubview(self.iconView)
		self.activateIconConstraitns()
		self.view.addSubview(self.yesButton)
		self.view.addSubview(self.noButton)
		self.activateYesButtonConstraitns()
		self.activateNoButtonConstraitns()
	}
	
	@objc private func openRegistrationTableScreen() {
		let newVC = RegistrationTableViewController()
		self.navigationController?.pushViewController(newVC, animated: true)
	}
	
	@objc private func openAviationSecurityTableScreen() {
		let newVC = AviationSecurityViewController()
		self.navigationController?.pushViewController(newVC, animated: true)
	}
}

extension RegisteredLuggageViewController {
	private func initLabel() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.luggageQuestion
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [21.0, 28.0, 30.0]))
		label.font = label.font.withSize(UIView.margin(of: [21.0, 28.0, 30.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initImageView() -> UIImageView {
		let image = #imageLiteral(resourceName: "suitcase")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initYesButton() -> UIImageView {
		let image = #imageLiteral(resourceName: "tickmark").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = .white
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openRegistrationTableScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
	
	private func initNoButton() -> UIImageView {
		let image = #imageLiteral(resourceName: "remove").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = .white
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openAviationSecurityTableScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
}

extension RegisteredLuggageViewController {
	private func activateLabelConstraitns() {
		NSLayoutConstraint.activate([
			self.screenLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [37.5, 50, 55])),
			self.screenLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.screenLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.screenLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90.0, 120.0, 150.0]))
		])
	}
	
	private func activateIconConstraitns() {
		NSLayoutConstraint.activate([
			self.iconView.topAnchor.constraint(equalTo: self.screenLabel.bottomAnchor, constant: UIView.margin(of: [36, 48, 55])),
			self.iconView.widthAnchor.constraint(equalToConstant: UIView.margin(of: [184, 246, 280])),
			self.iconView.heightAnchor.constraint(equalToConstant: UIView.margin(of: [184, 246, 280])),
			self.iconView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])
	}
	
	private func activateYesButtonConstraitns() {
		NSLayoutConstraint.activate([
			self.yesButton.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: UIView.margin(of: [75, 100, 115])),
			self.yesButton.widthAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.yesButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.yesButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [42, 56, 65]))
		])
	}
	
	private func activateNoButtonConstraitns() {
		NSLayoutConstraint.activate([
			self.noButton.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: UIView.margin(of: [75, 100, 115])),
			self.noButton.widthAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.noButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.noButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [42, 56, 65]))
		])
	}
}
