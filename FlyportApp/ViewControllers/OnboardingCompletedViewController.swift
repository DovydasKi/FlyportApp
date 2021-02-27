//
//  OnboardingCompletedViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class OnboardingCompletedViewController: UIViewController {
	private let viewModel = OnboardingCompletedViewModel()
	private lazy var titleLabel: UILabel = self.initLabel(title: self.viewModel.congratsTitle)
	private lazy var subtitleLabel: UILabel = self.initLabel(title: self.viewModel.congratsSubtitle)
	private lazy var icon: UIImageView = self.initIcon()
	private lazy var completeButton: UIImageView = self.initCompleteButton()
	private lazy var alert: UIAlertController = self.initAlert()
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.titleLabel)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.subtitleLabel)
		self.activateSubtitleLabelConstraints()
		self.view.addSubview(self.icon)
		self.activateIconConstraints()
		self.view.addSubview(self.completeButton)
		self.activateCompleteButtonConstraints()
	}
	
	@objc private func loadProfile() {
		self.viewModel.completeFlight(completion: {
			completed in
			if completed {
				let newVC = TabBarViewController()
				self.navigationController?.pushViewController(newVC, animated: true)
			} else {
				self.present(self.alert, animated: true, completion: nil)
			}
		})
	}
}

extension OnboardingCompletedViewController {
	private func initLabel(title: String) -> UILabel {
		let label = UILabel()
		label.text = title
		label.font = UIFont(name: "seguisym", size: UIView.margin(of: [23.0, 30.0, 32.0]))
		label.font = label.font.withSize(UIView.margin(of: [23.0, 30.0, 32.0]))
		label.textColor = .white
		label.numberOfLines = 0
		label.setNeedsLayout()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initIcon() -> UIImageView {
		let image = #imageLiteral(resourceName: "globe")
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initCompleteButton() -> UIImageView {
		let image = #imageLiteral(resourceName: "tickmark").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = .white
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.loadProfile)))
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

extension OnboardingCompletedViewController {
		private func activateTitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
		])
	}
	
		private func activateSubtitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.subtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.subtitleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90.0, 120.0, 150.0]))
		])
	}
	
	private func activateIconConstraints() {
		NSLayoutConstraint.activate([
			self.icon.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: UIView.margin(of: [15, 20, 25])),
			self.icon.widthAnchor.constraint(equalToConstant: UIView.margin(of: [150, 200, 220])),
			self.icon.heightAnchor.constraint(equalToConstant: UIView.margin(of: [150, 200, 220])),
			self.icon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])
	}
	
	private func activateCompleteButtonConstraints() {
		NSLayoutConstraint.activate([
			self.completeButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -UIView.margin(of: [53, 70, 80])),
			self.completeButton.widthAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.completeButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [90, 120, 130])),
			self.completeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])
	}
}
