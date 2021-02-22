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
	private lazy var newFlightCard: StartNewFlightCardView = self.initNewFlightCard()
	private lazy var noFlightsCard: NoFlightsCard = self.initNoFlightsCard()
	
	override func viewDidLoad() {
		self.navigationController?.navigationController?.setNavigationBarHidden(true, animated: true)
		self.addCards(completion: {
			self.view.addSubview(self.myFlightsLabel)
			self.activateMyFlightsTitleConstraints()
			
			if self.viewModel.isFlightsEmpty {
				self.view.addSubview(self.noFlightsCard)
				self.activateNoFlightsCardViewConstraints()
				self.view.addSubview(self.newFlightLabel)
				self.activateNewFlightTitleConstraintsWhenThereIsNoFlights()
				self.view.addSubview(self.newFlightCard)
				self.activateNewFlightCardConstraints()
			} else {
				self.view.addSubview(self.horizontalScrollView)
				self.activateScrollViewConstraints()
				self.horizontalScrollView.addSubview(self.stackView)
				self.activateStackViewConstraints()
				self.view.addSubview(self.newFlightLabel)
				self.activateNewFlightTitleConstraints()
				self.view.addSubview(self.newFlightCard)
				self.activateNewFlightCardConstraints()
			}
		})
	}
	
	private func addCards(completion: @escaping () -> ()) {
		self.viewModel.getFlightsData(completion: {
			flights in
			if let userFlights = flights {
				for flight in userFlights.flights {
					let view = FlightCardView(id: flight.flightId, airlines: flight.airlines, flightNumber: flight.flightNumber, fromCity: flight.fromCity, toCity: flight.toCity, isCompleted: flight.completed)
					view.translatesAutoresizingMaskIntoConstraints = false
					view.layer.cornerRadius = 20.0
					self.stackView.addArrangedSubview(view)
				}
				self.viewModel.isFlightsEmpty = false
				completion()
			} else {
				self.viewModel.isFlightsEmpty = true
				completion()
			}
		})
	}
	
	@objc private func openNextWindow() {
		//self.hidesBottomBarWhenPushed = true
		self.tabBarController?.tabBar.isHidden = true
		self.navigationController?.pushViewController(FlightNumberViewController(), animated: true)
		self.navigationController?.navigationBar.isHidden = true
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
	
	private func initNewFlightCard() -> StartNewFlightCardView {
		let card = StartNewFlightCardView()
		card.layer.cornerRadius = 20.0
		card.button.addTarget(self, action: #selector(self.openNextWindow), for: .touchUpInside)
		return card
	}
	
	private func initNoFlightsCard() -> NoFlightsCard {
		let card = NoFlightsCard()
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
	
	private func activateNoFlightsCardViewConstraints() {
		NSLayoutConstraint.activate([
			self.noFlightsCard.topAnchor.constraint(equalTo: self.myFlightsLabel.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
			self.noFlightsCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.noFlightsCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [12, 16, 20])),
			self.noFlightsCard.heightAnchor.constraint(equalToConstant: UIView.margin(of: [118, 158, 193]))
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
	
	private func activateNewFlightTitleConstraintsWhenThereIsNoFlights() {
		NSLayoutConstraint.activate([
			self.newFlightLabel.topAnchor.constraint(equalTo: self.noFlightsCard.bottomAnchor, constant: UIView.margin(of: [21, 28, 35])),
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
