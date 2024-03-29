//
//  BoardingGatesViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class BoardingGatesViewController: UIViewController {
	private let viewModel: BoardingGatesViewModel
	private lazy var arrowBack: UIImageView = self.initArrowBack()
	private lazy var routeLabel: UILabel = self.initSimpleLabel(title: self.viewModel.route)
	private lazy var flightNumberLabel: UILabel = self.initSimpleLabel(title: self.viewModel.flightNumber)
	private lazy var aviationSecurityTableTitle: UILabel = self.initSimpleLabel(title: self.viewModel.yourBoardingGates)
	private lazy var tableNumberLabel: UILabel = self.initNumberLabel()
	private lazy var icon: UIImageView = self.initIcon()
	private lazy var navigationButton: UIButton = self.initNavigateButton()
	private lazy var moveToNextButton: UIButton = self.initMoveToNextButton()
	private lazy var alert: UIAlertController = self.initAlert()
	
	public init(viewModel: BoardingGatesViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.arrowBack)
		self.activateBackArrowConstraints()
		self.view.addSubview(self.routeLabel)
		self.view.addSubview(self.flightNumberLabel)
		self.view.addSubview(self.aviationSecurityTableTitle)
		self.view.addSubview(self.tableNumberLabel)
		self.activateRouteLabelConstraints()
		self.activateFlightNumberLabelConstraints()
		self.activateRegistrationTableLabelConstraints()
		self.activateTableNumberLabelConstraints()
		self.view.addSubview(self.icon)
		self.activateIconConstraints()
		self.view.addSubview(self.navigationButton)
		self.activateNavigateButtonConstraints()
		self.view.addSubview(self.moveToNextButton)
		self.activateMoveToNextButtonConstraints()
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
	
	@objc private func moveToNextScreen() {
		let newVC = OnboardingCompletedViewController()
		self.navigationController?.pushViewController(newVC, animated: true)
	}
	
	@objc private func openMap() {
		let vm = MapViewModel(number: self.viewModel.tableNumber, mapType: .boarding)
		let newVC = MapViewController(viewModel: vm)
		self.navigationController?.pushViewController(newVC, animated: true)
	}
}

extension BoardingGatesViewController {
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
	
	private func initSimpleLabel(title: String) -> UILabel {
		let label = UILabel()
		label.text = title
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [14.0, 18.0, 20.0]))
		label.font = label.font.withSize(UIView.margin(of: [14.0, 18.0, 20.0]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initNumberLabel() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.tableNumber
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [30.0, 40.0, 40.0]))
		label.font = label.font.withSize(UIView.margin(of: [30.0, 40.0, 40.0]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initIcon() -> UIImageView {
		let image = #imageLiteral(resourceName: "BoardingGates")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initNavigateButton() -> UIButton {
		let button = UIButton()
		button.setTitle(self.viewModel.navigateToTable, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 30
		button.backgroundColor = .white
		button.titleLabel?.numberOfLines = 0
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.setTitleColor(UIColor(named: "ButtonColor"), for: .normal)
		button.addTarget(self, action: #selector(self.openMap), for: .touchUpInside)
		return button
	}
	
	private func initMoveToNextButton() -> UIButton {
		let button = UIButton()
		button.setTitle(self.viewModel.finish, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 30
		button.backgroundColor = .white
		button.titleLabel?.numberOfLines = 0
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.setTitleColor(UIColor(named: "ButtonColor"), for: .normal)
		button.addTarget(self, action: #selector(self.moveToNextScreen), for: .touchUpInside)
		return button
	}
	
	private func initAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.errorTitle, message: self.viewModel.errorSubtitle, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.ok, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
}

extension BoardingGatesViewController {
	private func activateBackArrowConstraints() {
		NSLayoutConstraint.activate([
			self.arrowBack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
			self.arrowBack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.arrowBack.heightAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0])),
			self.arrowBack.widthAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0]))
		])
	}
	
	private func activateRouteLabelConstraints() {
		NSLayoutConstraint.activate([
			self.routeLabel.topAnchor.constraint(equalTo: self.arrowBack.bottomAnchor, constant: 7.0),
			self.routeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.routeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateFlightNumberLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flightNumberLabel.topAnchor.constraint(equalTo: self.routeLabel.bottomAnchor, constant: UIView.margin(of: [11, 14, 17])),
			self.flightNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flightNumberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateRegistrationTableLabelConstraints() {
		NSLayoutConstraint.activate([
			self.aviationSecurityTableTitle.topAnchor.constraint(equalTo: self.flightNumberLabel.bottomAnchor, constant: UIView.margin(of: [11, 14, 17])),
			self.aviationSecurityTableTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.aviationSecurityTableTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateTableNumberLabelConstraints() {
		NSLayoutConstraint.activate([
			self.tableNumberLabel.topAnchor.constraint(equalTo: self.aviationSecurityTableTitle.bottomAnchor, constant: UIView.margin(of: [11, 14, 17])),
			self.tableNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.tableNumberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.tableNumberLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [55, 70, 80]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.icon.topAnchor.constraint(equalTo: self.tableNumberLabel.bottomAnchor, constant: UIView.margin(of: [11, 14, 17])),
			self.icon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [120, 150, 170])),
			self.icon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [120, 150, 170])),
			self.icon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])
	}
	
	private func activateNavigateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.navigationButton.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: UIView.margin(of: [30, 40, 45])),
			self.navigationButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [38, 50, 55])),
			self.navigationButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [38, 50, 55])),
			self.navigationButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [47, 62, 70]))
		])
	}
	
	private func activateMoveToNextButtonConstraints() {
		NSLayoutConstraint.activate([
			self.moveToNextButton.topAnchor.constraint(equalTo: self.navigationButton.bottomAnchor, constant: UIView.margin(of: [60, 80, 80])),
			self.moveToNextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [38, 50, 55])),
			self.moveToNextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [38, 50, 55])),
			self.moveToNextButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [47, 62, 70]))
		])
	}
}


