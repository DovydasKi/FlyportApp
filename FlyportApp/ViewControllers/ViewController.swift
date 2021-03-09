//
//  ViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2020-01-01.
//  Copyright © 2020 Dovydas Kiriliauskas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	private lazy var flyportLabel: UILabel = self.initFlyportLabel()
	private lazy var flyportLogo: UIImageView = self.initFlyportLogo()
	private lazy var flyportSubtitleLabel: UILabel = self.initFlyportSubtitleLabel()
	private var splashScreenViewModel = SplashScreenViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
		
		self.view.addSubview(self.flyportLabel)
		self.activateFlyportLabelConstraints()
		
		self.view.addSubview(self.flyportSubtitleLabel)
		self.activateFlyportSubtitleLabelConstraints()
		
		self.view.addSubview(self.flyportLogo)
		self.activateFlyportLogoConstraints()
		
		let viewController = MainScreenViewController()
		DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
			self.navigationController?.setViewControllers([viewController], animated: false)
		}
	}
}

//MARK: UI elements extension
extension ViewController {
	private func initFlyportLabel() -> UILabel {
		let label = UILabel()
		label.text = self.splashScreenViewModel.flyportLabelTitle
		label.font = UIFont(name: "seguisym", size: UIView.margin(of: [75.0, 100.0, 125.0]))
		label.font = label.font.withSize(UIView.margin(of: [75.0, 100.0, 125.0]))
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initFlyportLogo() -> UIImageView {
		let image = #imageLiteral(resourceName: "SplashScreenIcon")
		let imageView = UIImageView(image: image)
		imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}
	
	private func initFlyportSubtitleLabel() -> UILabel {
		let label = UILabel()
		label.text = self.splashScreenViewModel.flyportSubtitleText
		label.font = UIFont(name: "seguisym", size: UIView.margin(of: [15.0, 20.0, 25.0]))
		label.font = label.font.withSize(UIView.margin(of: [15.0, 20.0, 25.0]))
		label.textColor = UIColor(named: "titleColor")
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
}

//MARK: Constraints extension
extension ViewController {
	private func activateFlyportLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flyportLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIView.margin(of: [112.5, 150.0, 187.5])),
			self.flyportLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flyportLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.flyportLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [82.5, 110, 137.5]))
		])
	}
	
	private func activateFlyportSubtitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flyportSubtitleLabel.topAnchor.constraint(equalTo: self.flyportLabel.bottomAnchor, constant: UIView.margin(of: [24, 32, 40])),
			self.flyportSubtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.flyportSubtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.flyportSubtitleLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [18, 24, 30]))
		])
	}
	
	private func activateFlyportLogoConstraints() {
		NSLayoutConstraint.activate([
			self.flyportLogo.topAnchor.constraint(equalTo: self.flyportSubtitleLabel.bottomAnchor, constant: UIView.margin(of: [24, 32, 40])),
			self.flyportLogo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [78.0, 104.5, 131.0])),
			self.flyportLogo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [78.0, 104.5, 131.0]))
		])
	}
}
