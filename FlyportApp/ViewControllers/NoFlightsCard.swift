//
//  NoFlightsCard.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-16.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class NoFlightsCard: UIView {
	private lazy var icon: UIImageView = self.initIconView()
	private lazy var questionLabel: UILabel = self.initquestionLabel()
	private lazy var subtitleLabel: UILabel = self.initSubtitleLabel()
	
	public init() {
		super.init(frame: CGRect.zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = UIColor(named: "ButtonColor")
		
		self.addSubview(self.icon)
		self.addSubview(self.questionLabel)
		self.addSubview(self.subtitleLabel)
		
		self.activateImageConstraints()
		self.activateQuestionLabelConstraints()
		self.activateSubtitleConstraints()
	}
}

extension NoFlightsCard {
	private func initIconView() -> UIImageView {
		let image = #imageLiteral(resourceName: "Luggage")
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 95, height: 95)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initquestionLabel() -> UILabel {
		let label = UILabel()
		label.text = "Oooops"
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [15.0, 20.0, 25.0]))
		label.font = label.font.withSize(UIView.margin(of: [15.0, 20.0, 25.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initSubtitleLabel() -> UILabel {
		let label = UILabel()
		label.text = "It seems you haven't flied with us befor!"
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [10.0, 14.0, 18.0]))
		label.font = label.font.withSize(UIView.margin(of: [10.0, 14.0, 18.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
}

extension NoFlightsCard {
	private func activateImageConstraints() {
		NSLayoutConstraint.activate([
			self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIView.margin(of: [20, 27, 34])),
			self.icon.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [36,49,62])),
			self.icon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [71,95,118])),
			self.icon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [71,95,118]))
		])
	}
	
	private func activateQuestionLabelConstraints() {
		NSLayoutConstraint.activate([
			self.questionLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [12,17,22])),
			self.questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [20,26,32])),
			self.questionLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [18,25,32]))
		])
	}
	
	private func activateSubtitleConstraints() {
		NSLayoutConstraint.activate([
			self.subtitleLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [12,17,22])),
			self.subtitleLabel.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: UIView.margin(of: [20,26,32])),
			self.subtitleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45,60,75]))
		])
	}
}
