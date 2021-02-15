//
//  FlightCardView.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-10.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class FlightCardView: UIView {
	private let airlinesImage: UIImage
	private let flightNumber: String
	private let route: String
	private let flightStatus: String
	
	public init(airlines: String, flightNumber: String, fromCity: String, toCity: String, isCompleted: Bool) {
		let airlinesType = Airlines(airlinesName: airlines)
		self.airlinesImage = airlinesType.getAirlinesImage()
		self.flightNumber = flightNumber
		let route = fromCity + " - " + toCity
		self.route = route
		if isCompleted {
			self.flightStatus = "Comleted flight"
		} else {
			self.flightStatus = "Incompleted flight"
		}
		super.init(frame: CGRect.zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		let photoView = self.photoView(image: airlinesImage)
		let titleLabel = self.initFlightNumberTitle(flightNumber: self.flightNumber)
		let routeLabel = self.initRouteTitle(route: self.route)
		let completionLabel = self.initCompletionTitle(flightStatus: self.flightStatus)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = UIColor(named: "ButtonColor")
		self.addSubview(photoView)
		self.addSubview(titleLabel)
		self.addSubview(routeLabel)
		self.addSubview(completionLabel)
		
		NSLayoutConstraint.activate([
			photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIView.margin(of: [9, 12, 15])),
			photoView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			photoView.heightAnchor.constraint(equalToConstant: UIView.margin(of: [30, 40, 50])),
			photoView.widthAnchor.constraint(equalToConstant: UIView.margin(of: [63, 85, 106])),
			titleLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: UIView.margin(of: [10, 13, 16])),
			titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [20, 27, 34])),
			titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [7, 10, 13])),
			titleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [15, 20, 25]))
		])
		
		NSLayoutConstraint.activate([
			routeLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: UIView.margin(of: [10, 13, 16])),
			routeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UIView.margin(of: [7, 10, 13])),
			routeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [7, 10, 13])),
			routeLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [15, 20, 25]))
		])
		
		NSLayoutConstraint.activate([
			completionLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: UIView.margin(of: [10, 13, 16])),
			completionLabel.topAnchor.constraint(equalTo: routeLabel.bottomAnchor, constant: UIView.margin(of: [7, 10, 13])),
			completionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [7, 10, 13])),
			completionLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [24, 32, 40]))
		])
	}
}

extension FlightCardView {
	private func photoView(image: UIImage) -> UIImageView {
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 85, height: 40)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}
	
	private func initFlightNumberTitle(flightNumber: String) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = flightNumber
		label.font = UIFont(name: "Sora-Medium", size: 17.0)
		label.font = label.font.withSize(17.0)
		label.textColor = .white
		label.textAlignment = .center
		return label
	}
	
	private func initRouteTitle(route: String) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = route
		label.font = UIFont(name: "Sora-Medium", size: 15.0)
		label.font = label.font.withSize(15.0)
		label.textColor = .white
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
	}
	
	private func initCompletionTitle(flightStatus: String) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = flightStatus
		label.font = UIFont(name: "Sora-Medium", size: 17.0)
		label.font = label.font.withSize(17.0)
		label.textColor = .white
		label.textAlignment = .center
		label.layer.borderColor = UIColor.white.cgColor
		label.layer.borderWidth = 2.0
		label.layer.cornerRadius = 20.0
		return label
	}
}
