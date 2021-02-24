//
//  FlightNumberViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-22.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class FlightDateViewController: UIViewController {
	private var viewModel: FlightDateViewModel
	private lazy var arrowBack: UIImageView = self.initArrowBack()
	private lazy var textLabel: UILabel = self.initLabel()
	private lazy var iconView: UIImageView = self.initIconView()
	private lazy var flightDateInputField = self.initFlightNumberInputField()
	private lazy var completeButton: UIButton = self.initButton()
	private lazy var datePicker: UIDatePicker = self.initDatePicker()
	
	public init(viewModel: FlightDateViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.arrowBack)
		self.activateBackArrowConstraints()
		self.view.addSubview(self.textLabel)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.iconView)
		self.activateIconConstraints()
		self.view.addSubview(self.flightDateInputField)
		self.activateTextFieldConstraints()
		self.view.addSubview(self.completeButton)
		self.activateButtonConstraints()
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
	
	@objc private func openNextScreen() {
		if self.viewModel.checkValidDate(dateTextField: self.flightDateInputField) {
			let newVc = RegisteredLuggageViewController()
			self.navigationController?.pushViewController(newVc, animated: true)
		}
	}
	
	@objc func datePickerValueChanged(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let selectedDate: String = dateFormatter.string(from: sender.date)
		self.flightDateInputField.text = selectedDate
	}
	
	@objc func action() {
		view.endEditing(true)
	}
}

extension FlightDateViewController {
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
		label.text = self.viewModel.enterDate
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
		let image = #imageLiteral(resourceName: "flightDate")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initFlightNumberInputField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = self.viewModel.flightDatePlaceholder
		textField.inputView = self.datePicker
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.textColor = UIColor(named: "ButtonColor")
		textField.borderStyle = .roundedRect
		textField.layer.borderColor = UIColor(named: "ButtonColor")?.cgColor
		textField.font = UIFont.init(name: "seguisym", size: UIView.margin(of: [12, 16, 20]))
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 2
		textField.textAlignment = .center
		
		let toolBar = UIToolbar()
		toolBar.sizeToFit()
		let button = UIBarButtonItem(title: self.viewModel.select, style: .plain, target: self, action: #selector(self.action))
		toolBar.setItems([button], animated: true)
		toolBar.isUserInteractionEnabled = true
		textField.inputAccessoryView = toolBar
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
		button.addTarget(self, action: #selector(self.openNextScreen), for: .touchUpInside)
		return button
	}
	
	private func initDatePicker() -> UIDatePicker {
		let pickerView = UIDatePicker()
		pickerView.datePickerMode = UIDatePicker.Mode.date
		pickerView.translatesAutoresizingMaskIntoConstraints = false
		pickerView.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
		
		return pickerView
	}
}

extension FlightDateViewController {
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
			self.flightDateInputField.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: UIView.margin(of: [38, 50, 62])),
			self.flightDateInputField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [33, 44, 50])),
			self.flightDateInputField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [33, 44, 50])),
			self.flightDateInputField.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45, 60, 70]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.completeButton.topAnchor.constraint(equalTo: self.flightDateInputField.bottomAnchor, constant: UIView.margin(of: [45, 60, 70])),
			self.completeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 75])),
			self.completeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 75])),
			self.completeButton.heightAnchor.constraint(equalToConstant: UIView.margin(of:[45, 60, 75]))
		])
	}
}
