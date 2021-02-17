//
//  AirportPointCardView.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-17.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class AirportPointCardView: UIView {
	private lazy var icon: UIImageView = self.initIconView()
	private lazy var titleLabel: UILabel = self.initquestionLabel()
	private lazy var subtitleLabel: UILabel = self.initSubtitleLabel()
	private let imageName: String
	private let titleText: String
	private let pointNumber: String
	
	public init(imageName: String, titleText: String, pointNumber: String) {
		self.imageName = imageName
		self.titleText = titleText
		self.pointNumber = pointNumber
		super.init(frame: CGRect.zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .white
		
		self.addSubview(self.icon)
		self.addSubview(self.titleLabel)
		self.addSubview(self.subtitleLabel)
		
		self.activateImageConstraints()
		self.activateQuestionLabelConstraints()
		self.activateSubtitleConstraints()
	}
}

extension AirportPointCardView {
	private func initIconView() -> UIImageView {
		let image = UIImage(named: self.imageName)
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 95, height: 95)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initquestionLabel() -> UILabel {
		let label = UILabel()
		label.text = self.titleText
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [13.0, 17.0, 21.0]))
		label.font = label.font.withSize(UIView.margin(of: [13.0, 17.0, 21.0]))
		label.textColor = UIColor(named: "ButtonColor")
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initSubtitleLabel() -> UILabel {
		let label = UILabel()
		label.text = self.pointNumber
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [36.0, 48.0, 60.0]))
		label.font = label.font.withSize(UIView.margin(of: [36.0, 48.0, 60.0]))
		label.textColor = UIColor(named: "ButtonColor")
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
}

extension AirportPointCardView {
	private func activateImageConstraints() {
		NSLayoutConstraint.activate([
			self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIView.margin(of: [9, 12, 15])),
			self.icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			self.icon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [57,76,95])),
			self.icon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [57,76,95])),
			self.heightAnchor.constraint(equalToConstant: 146)
		])
	}
	
	private func activateQuestionLabelConstraints() {
		NSLayoutConstraint.activate([
			self.titleLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [12,16,20])),
			self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.margin(of: [9, 12, 15])),
			self.titleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [37,50,62]))
		])
	}
	
	private func activateSubtitleConstraints() {
		NSLayoutConstraint.activate([
			self.subtitleLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIView.margin(of: [12,16,20])),
			self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: UIView.margin(of: [12, 16, 20])),
			self.subtitleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [45,60,75]))
		])
	}
}
