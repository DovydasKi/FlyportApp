//
//  StartNewFlightCardView.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-15.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class StartNewFlightCardView: UIView {
	private lazy var icon: UIImageView = self.initIconView()
	private lazy var questionLabel: UILabel = self.initquestionLabel()
	private lazy var button: UIButton = self.initButton()
	
	public init() {
		super.init(frame: CGRect.zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = UIColor(named: "CardYellow")
		
		self.addSubview(self.icon)
		self.addSubview(self.questionLabel)
		self.addSubview(self.button)
		
		self.activateImageConstraints()
		self.activateQuestionLabelConstraints()
		self.activateButtonConstraints()
	}
}

extension StartNewFlightCardView {
	private func initIconView() -> UIImageView {
		let image = #imageLiteral(resourceName: "SplashScreenIcon")
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 111, height: 111)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initquestionLabel() -> UILabel {
		let label = UILabel()
		label.text = "Ready for the new trip?"
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [15.0, 20.0, 25.0]))
		label.font = label.font.withSize(UIView.margin(of: [15.0, 20.0, 25.0]))
		label.textColor = UIColor(named: "titleColor")
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initButton() -> UIButton {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Add new trip", for: .normal)
		button.setTitleColor(UIColor(named: "CardYellow"), for: .normal)
		button.backgroundColor = UIColor(named: "ButtonColor")
		button.layer.cornerRadius = 30.0
		return button
	}
}

extension StartNewFlightCardView {
	private func activateImageConstraints() {
		NSLayoutConstraint.activate([
			self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIView.margin(of: [20, 27, 34])),
			self.icon.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [36,49,62])),
			self.icon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [83,111,111])),
			self.icon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [83,111,111]))
		])
	}
	
	private func activateQuestionLabelConstraints() {
		NSLayoutConstraint.activate([
			self.questionLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [19,25,31])),
			self.questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [20,26,32])),
			self.questionLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45,60,75]))
		])
	}
	
	private func activateButtonConstraints() {
		NSLayoutConstraint.activate([
			self.button.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [19,25,31])),
			self.button.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: UIView.margin(of: [27,36,45])),
			self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIView.margin(of: [23,31,39]))
		])
	}
}
