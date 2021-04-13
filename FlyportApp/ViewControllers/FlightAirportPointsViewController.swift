//
//  FlightAirportPointsViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-17.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class FlightAirportPointsViewController: UIViewController {
	private let viewModel: FlightAirportPointsViewModel
	private lazy var arrowBack: UIImageView = self.initArrowImage()
	private lazy var airlinesLogo: UIImageView = self.initAirlinesLogo()
	private lazy var routeLabel: UILabel = self.initLabel(text: self.viewModel.route)
	private lazy var numberLabel: UILabel = self.initLabel(text: self.viewModel.flightNumber)
	private lazy var horizontalScrollView: UIScrollView = self.initScrollView()
	private lazy var stackView: UIStackView = self.initStackView()
	
	public init(viewModel: FlightAirportPointsViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.addCards(completion: {
			self.view.addSubview(self.airlinesLogo)
			self.activateAirlinesIconConstraints()
			self.view.addSubview(self.routeLabel)
			self.activateRouteTitleConstraints()
			self.view.addSubview(self.numberLabel)
			self.activateFlightNumberTitleConstraints()
			self.view.addSubview(self.horizontalScrollView)
			self.activateScrollViewConstraints()
			self.horizontalScrollView.addSubview(self.stackView)
			self.activateStackViewConstraints()
		})
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
	
	private func addCards(completion: @escaping () -> ()) {
		self.viewModel.getFlightsData(completion: {
			result in
			if let points = result {
				if let registrationPoint = points.registrationPoint {
					let registrationCard = AirportPointCardView(imageName: self.viewModel.registrationTableImage, titleText: self.viewModel.registrationTableTitle, pointNumber: registrationPoint.pointNumber)
					registrationCard.translatesAutoresizingMaskIntoConstraints = false
					registrationCard.layer.cornerRadius = 20.0
					self.stackView.addArrangedSubview(registrationCard)
					self.activateCardViewConstraints(view: registrationCard)
				}
				if let securityPoint = points.securityPoint {
					let securityCard = AirportPointCardView(imageName: self.viewModel.aviationSecurityPostImage, titleText: self.viewModel.aviationSecurityPostTitle, pointNumber: securityPoint.pointNumber)
					securityCard.translatesAutoresizingMaskIntoConstraints = false
					securityCard.layer.cornerRadius = 20.0
					self.stackView.addArrangedSubview(securityCard)
					self.activateCardViewConstraints(view: securityCard)
				}
				if let passportPoint = points.passportPoint {
					let passportCard = AirportPointCardView(imageName: self.viewModel.passportControlPostImage, titleText: self.viewModel.passportControlPostTitle, pointNumber: passportPoint.pointNumber)
					passportCard.translatesAutoresizingMaskIntoConstraints = false
					passportCard.layer.cornerRadius = 20.0
					self.stackView.addArrangedSubview(passportCard)
					self.activateCardViewConstraints(view: passportCard)
				}
				if let boardingGates = points.boardingGates {
					let boardingGatesCard = AirportPointCardView(imageName: self.viewModel.boardingGatesImage, titleText: self.viewModel.boardingGatesTitle, pointNumber: boardingGates.pointNumber)
					boardingGatesCard.translatesAutoresizingMaskIntoConstraints = false
					boardingGatesCard.layer.cornerRadius = 20.0
					self.stackView.addArrangedSubview(boardingGatesCard)
					self.activateCardViewConstraints(view: boardingGatesCard)
				}
				completion()
			} else {
				completion()
			}
		})
	}
}

extension FlightAirportPointsViewController {
	private func initArrowImage() -> UIImageView {
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
	
	private func initAirlinesLogo() -> UIImageView {
		let image = self.viewModel.airlinesImage
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initLabel(text: String) -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [15,20,25]))
		label.font = label.font.withSize(UIView.margin(of: [15,20,25]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
	}
	
	private func initScrollView() -> UIScrollView {
		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.isPagingEnabled = false
		scrollView.bounces = true
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}
	
	private func initStackView() -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.spacing = 25.0
		stackView.distribution = .fillEqually
		stackView.alignment = .fill
		stackView.sizeToFit()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}
}

extension FlightAirportPointsViewController {
	private func activateAirlinesIconConstraints() {
		NSLayoutConstraint.activate([
			self.airlinesLogo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIView.margin(of: [30, 40, 50])),
			self.airlinesLogo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [50, 67, 84])),
			self.airlinesLogo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [50, 67, 84])),
			self.airlinesLogo.heightAnchor.constraint(equalToConstant: UIView.margin(of: [60,80,80]))
		])
	}
	
	private func activateRouteTitleConstraints() {
		NSLayoutConstraint.activate([
			self.routeLabel.topAnchor.constraint(equalTo: self.airlinesLogo.bottomAnchor, constant: UIView.margin(of: [28, 38, 48])),
			self.routeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.routeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [12, 16, 20])),
			self.routeLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45, 60, 75]))
		])
	}
	
	private func activateFlightNumberTitleConstraints() {
		NSLayoutConstraint.activate([
			self.numberLabel.topAnchor.constraint(equalTo: self.routeLabel.bottomAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.numberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.numberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [12, 16, 20])),
			self.numberLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45, 60, 75]))
		])
	}
	
	private func activateScrollViewConstraints() {
		NSLayoutConstraint.activate([
			self.horizontalScrollView.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.horizontalScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.horizontalScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [12, 16, 20])),
			self.horizontalScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	private func activateStackViewConstraints() {
		NSLayoutConstraint.activate([
			self.stackView.topAnchor.constraint(equalTo: self.horizontalScrollView.topAnchor),
			self.stackView.leadingAnchor.constraint(equalTo: self.horizontalScrollView.leadingAnchor),
			self.stackView.trailingAnchor.constraint(equalTo: self.horizontalScrollView.trailingAnchor),
			self.stackView.bottomAnchor.constraint(equalTo: self.horizontalScrollView.bottomAnchor),
			self.stackView.widthAnchor.constraint(equalTo: self.horizontalScrollView.widthAnchor),
		])
	}
	
	private func activateCardViewConstraints(view: AirportPointCardView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			view.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
			view.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
		])
	}

}
