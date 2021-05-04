//
//  SelectedFlightViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-25.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

public class SelectedFlightViewController: UIViewController {
	public var viewModel: SelectedFlightViewModel
	private lazy var arrowBack: UIImageView = self.initArrowBack()
	private lazy var yourFlightTitle: UILabel = self.initLabel(text: self.viewModel.youtFlightTitle)
	private lazy var airlinesImage: UIImageView = self.initAirlinesLogo()
	private lazy var route: UILabel = self.initLabel(text: self.viewModel.fullRoute)
	private lazy var flightnumber: UILabel = self.initLabel(text: self.viewModel.getFlightInfo().flightNumber)
	private lazy var flightDate: UILabel = self.initLabel(text: self.viewModel.date)
	private lazy var yesButton: UIImageView = self.initYesButton()
	private lazy var noButton: UIImageView = self.initNoButton()
	private lazy var alert: UIAlertController = self.initAlert()
	private lazy var loadingView: UIView = UIView(frame: CGRect.zero).loadingView
	private lazy var activityIndicator: NVActivityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero).loadingIndicator
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.arrowBack)
		self.activateBackArrowConstraints()
		self.view.addSubview(self.yourFlightTitle)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.airlinesImage)
		self.activateAirlinesIconConstraints()
		self.view.addSubview(self.route)
		self.activateRouteLabelConstraints()
		self.view.addSubview(self.flightnumber)
		self.activateFlightNumberLabelConstraints()
		self.view.addSubview(self.flightDate)
		self.activateFlightDateLabelConstraints()
		self.view.addSubview(self.yesButton)
		self.view.addSubview(self.noButton)
		self.activateYesButtonConstraitns()
		self.activateNoButtonConstraitns()
	}
	
	public init(viewModel: SelectedFlightViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
	
	@objc private func moveToNextScreen() {
		self.view.addSubview(self.loadingView)
		self.view.addSubview(self.activityIndicator)
		self.activateLoadingViewConstraints()
		self.activateActivityIndicatorConstraints()
		self.activityIndicator.startAnimating()
		
		self.viewModel.registerFlight(completion: {
			result in
			if result {
				let vm = RegisteredLuggageViewModel(flightInfo: self.viewModel.getFlightInfo())
				let newVC = RegisteredLuggageViewController(viewModel: vm)
				self.stopAnimating()
				self.navigationController?.pushViewController(newVC, animated: true)
			} else {
				self.stopAnimating()
				self.present(self.alert, animated: true, completion: nil)
			}
		})
	}
	
	private func stopAnimating() {
		self.activityIndicator.stopAnimating()
		self.loadingView.removeFromSuperview()
		self.activityIndicator.removeFromSuperview()
	}
}

extension SelectedFlightViewController {
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
	
	private func initLabel(text: String) -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [18.0, 24.0, 24.0]))
		label.font = label.font.withSize(UIView.margin(of: [18.0, 24.0, 24.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initAirlinesLogo() -> UIImageView {
		let airlinesType = Airlines(airlinesName: self.viewModel.getFlightInfo().airlines)
		let airlinesImage = airlinesType.getAirlinesImage()
		let imageView = UIImageView(image: airlinesImage)
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
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.moveToNextScreen)))
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
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.returnToPreviousScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
	
	private func initAlert() -> UIAlertController {
		let alert = UIAlertController(title: self.viewModel.errorTitle, message: self.viewModel.errorSubtitle, preferredStyle: .alert)
		let action = UIAlertAction(title: self.viewModel.ok, style: .default, handler: nil)
		alert.addAction(action)
		return alert
	}
}

extension SelectedFlightViewController {
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
			self.yourFlightTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
			self.yourFlightTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.yourFlightTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateAirlinesIconConstraints() {
		NSLayoutConstraint.activate([
			self.airlinesImage.topAnchor.constraint(equalTo: self.yourFlightTitle.bottomAnchor, constant: UIView.margin(of: [30, 40, 45])),
			self.airlinesImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.airlinesImage.heightAnchor.constraint(equalToConstant: UIView.margin(of: [60, 80, 85])),
			self.airlinesImage.widthAnchor.constraint(equalToConstant: UIView.margin(of: [150, 200, 220]))
		])
	}
	
	private func activateRouteLabelConstraints() {
		NSLayoutConstraint.activate([
			self.route.topAnchor.constraint(equalTo: self.airlinesImage.bottomAnchor, constant: UIView.margin(of: [30, 40, 45])),
			self.route.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.route.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateFlightNumberLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flightnumber.topAnchor.constraint(equalTo: self.route.bottomAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.flightnumber.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flightnumber.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateFlightDateLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flightDate.topAnchor.constraint(equalTo: self.flightnumber.bottomAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.flightDate.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flightDate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateYesButtonConstraitns() {
		NSLayoutConstraint.activate([
			self.yesButton.topAnchor.constraint(equalTo: self.flightDate.bottomAnchor, constant: UIView.margin(of: [75, 100, 115])),
			self.yesButton.widthAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.yesButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.yesButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [42, 56, 65]))
		])
	}
	
	private func activateNoButtonConstraitns() {
		NSLayoutConstraint.activate([
			self.noButton.topAnchor.constraint(equalTo: self.flightDate.bottomAnchor, constant: UIView.margin(of: [75, 100, 115])),
			self.noButton.widthAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.noButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.noButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [42, 56, 65]))
		])
	}
	
	private func activateActivityIndicatorConstraints() {
		NSLayoutConstraint.activate([
			self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
		])
	}
	
	private func activateLoadingViewConstraints() {
		NSLayoutConstraint.activate([
			self.loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.loadingView.topAnchor.constraint(equalTo: self.view.topAnchor),
			self.loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
		])
	}
}
