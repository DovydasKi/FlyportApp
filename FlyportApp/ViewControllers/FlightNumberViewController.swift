//
//  FlightNumberViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-22.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class FlightNumberViewController: UIViewController {
	private let viewModel = FlightNumberViewModel()
	private lazy var arrowBack: UIImageView = self.initArrowBack()
	private lazy var textLabel: UILabel = self.initLabel()
	private lazy var iconView: UIImageView = self.initIconView()
	private lazy var flightNumberInputField = self.initFlightNumberInputField()
	private lazy var completeButton: UIButton = self.initButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.arrowBack)
		self.activateBackArrowConstraints()
		self.view.addSubview(self.textLabel)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.iconView)
		self.activateIconConstraints()
		self.view.addSubview(self.flightNumberInputField)
		self.activateTextFieldConstraints()
		self.view.addSubview(self.completeButton)
		self.activateButtonConstraints()
	}
	
	@objc private func returnToPreviousScreen() {
		self.tabBarController?.tabBar.isHidden = false
		self.navigationController?.popViewController(animated: true)
		self.navigationController?.navigationBar.isHidden = false
	}
	
	@objc private func openDateScreen() {
		if let text = self.flightNumberInputField.text {
			let dateViewModel = FlightDateViewModel(flightNumber: text)
			let newVC = FlightDateViewController(viewModel: dateViewModel)
			self.navigationController?.pushViewController(newVC, animated: true)
		}
	}
}

extension FlightNumberViewController {
	private func initArrowBack() -> UIImageView {
		let image = #imageLiteral(resourceName: "returnArrow").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = .white
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnToPreviousScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
	
	private func initLabel() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.enterNumber
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [21.0, 28.0, 30.0]))
		label.font = label.font.withSize(UIView.margin(of: [21.0, 28.0, 30.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initIconView() -> UIImageView {
		let image = #imageLiteral(resourceName: "ticket")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initFlightNumberInputField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = self.viewModel.flightNumberPlaceholder
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.textColor = UIColor(named: "ButtonColor")
		textField.borderStyle = .roundedRect
		textField.layer.borderColor = UIColor(named: "ButtonColor")?.cgColor
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [12, 16, 20]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
		textField.textAlignment = .center 
		return textField
	}
	
	private func initButton() -> UIButton {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.layer.cornerRadius = 30
		button.backgroundColor = .white
		button.tintColor = UIColor(named: "ButtonColor")
		button.addTarget(self, action: #selector(self.openDateScreen), for: .touchUpInside)
		return button
	}
}

extension FlightNumberViewController {
	private func activateBackArrowConstraints() {
		NSLayoutConstraint.activate([
			self.arrowBack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
			self.arrowBack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.arrowBack.heightAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0])),
			self.arrowBack.widthAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0]))
		])
	}
	
	private func activateTitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.textLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [37.5, 50, 55])),
			self.textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.textLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.textLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90.0, 120.0, 150.0]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.iconView.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: UIView.margin(of: [26, 35, 43])),
			self.iconView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.iconView.heightAnchor.constraint(equalToConstant: UIView.margin(of: [120, 150.0, 150])),
			self.iconView.widthAnchor.constraint(equalToConstant: UIView.margin(of: [120, 150.0, 150]))
		])
	}
	
	private func activateTextFieldConstraints() {
		NSLayoutConstraint.activate([
			self.flightNumberInputField.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: UIView.margin(of: [38, 50, 62])),
			self.flightNumberInputField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [33, 44, 50])),
			self.flightNumberInputField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [33, 44, 50])),
			self.flightNumberInputField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45, 60, 70]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.completeButton.topAnchor.constraint(equalTo: self.flightNumberInputField.bottomAnchor, constant: UIView.margin(of: [45, 60, 70])),
			self.completeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 75])),
			self.completeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 75])),
			self.completeButton.heightAnchor.constraint(equalToConstant: UIView.margin(of:[45, 60, 75]))
		])
	}
}
