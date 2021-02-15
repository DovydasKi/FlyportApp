//
//  MyFlightsViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class MyFlightsViewController: UIViewController {
	private let viewModel = MyFlightsViewModel()
	private lazy var myFlightsLabel: UILabel = self.initLabel(text: self.viewModel.myFlights)
	private lazy var horizontalScrollView: UIScrollView = self.initScrollView()
	private lazy var newFlightLabel: UILabel = self.initLabel(text: self.viewModel.newFlight)
	private lazy var stackView: UIStackView = self.initStackView()
	private lazy var card: UIView = self.initCardView()
	private lazy var anothercard: UIView = self.initCardView()
	private lazy var newFlightCard: StartNewFlightCardView = self.initNewFlightCard()
	
	override func viewDidLoad() {
		self.view.addSubview(self.myFlightsLabel)
		self.activateMyFlightsTitleConstraints()
		self.view.addSubview(self.horizontalScrollView)
		self.activateScrollViewConstraints()
		self.horizontalScrollView.addSubview(self.stackView)
		self.activateStackViewConstraints()
		self.stackView.addArrangedSubview(self.card)
		self.stackView.addArrangedSubview(self.anothercard)
		self.view.addSubview(self.newFlightLabel)
		self.activateNewFlightTitleConstraints()
		self.view.addSubview(self.newFlightCard)
		self.activateNewFlightCardConstraints()
//		self.view.addSubview(self.card)
//		self.activateCardViewConstraints()
	}
}

extension MyFlightsViewController {
	private func initLabel(text: String) -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont(name: "Sora-Medium", size: 23.0)
		label.font = label.font.withSize(23.0)
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
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
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		stackView.spacing = 16.0
		stackView.distribution = .fillEqually
		stackView.alignment = .fill
		stackView.sizeToFit()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}
	
	private func initCardView() -> UIView {
		let view = FlightCardView(airlines: "GetJet airlines", flightNumber: "GW3352", fromCity: "Vilnius(VNO)", toCity: "Enfidha(NBE)", isCompleted: true)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 20.0
		return view
	}
	
	private func initNewFlightCard() -> StartNewFlightCardView {
		let card = StartNewFlightCardView()
		card.layer.cornerRadius = 20.0
		return card
	}
}

extension MyFlightsViewController {
		private func activateMyFlightsTitleConstraints() {
		NSLayoutConstraint.activate([
			self.myFlightsLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.myFlightsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [18, 24, 30])),
			self.myFlightsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [38, 51, 64]))
		])
	}
	
		private func activateScrollViewConstraints() {
		NSLayoutConstraint.activate([
			self.horizontalScrollView.topAnchor.constraint(equalTo: self.myFlightsLabel.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.horizontalScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.horizontalScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.horizontalScrollView.heightAnchor.constraint(equalToConstant: UIView.margin(of: [112, 150, 187]))
		])
	}
	
		private func activateCardViewConstraints() {
		NSLayoutConstraint.activate([
			self.card.topAnchor.constraint(equalTo: self.horizontalScrollView.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.card.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0),
			self.card.heightAnchor.constraint(equalToConstant: UIView.margin(of: [101, 135, 168])),
			self.card.widthAnchor.constraint(equalToConstant: UIView.margin(of: [228, 304, 380]))
		])
	}
	
		private func activateStackViewConstraints() {
		NSLayoutConstraint.activate([
			self.stackView.topAnchor.constraint(equalTo: self.horizontalScrollView.topAnchor),
			self.stackView.leadingAnchor.constraint(equalTo: self.horizontalScrollView.leadingAnchor),
			self.stackView.trailingAnchor.constraint(equalTo: self.horizontalScrollView.trailingAnchor),
			self.stackView.bottomAnchor.constraint(equalTo: self.horizontalScrollView.bottomAnchor),
			self.stackView.heightAnchor.constraint(equalTo: self.horizontalScrollView.heightAnchor)
		])
	}
	
		private func activateNewFlightTitleConstraints() {
		NSLayoutConstraint.activate([
			self.newFlightLabel.topAnchor.constraint(equalTo: self.horizontalScrollView.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.newFlightLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [18, 24, 30])),
			self.newFlightLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [38, 51, 64]))
		])
	}
	
		private func activateNewFlightCardConstraints() {
		NSLayoutConstraint.activate([
			self.newFlightCard.topAnchor.constraint(equalTo: self.newFlightLabel.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.newFlightCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.newFlightCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [12, 16, 20])),
			self.newFlightCard.heightAnchor.constraint(equalToConstant: UIView.margin(of: [156,209,261]))
		])
	}
}
