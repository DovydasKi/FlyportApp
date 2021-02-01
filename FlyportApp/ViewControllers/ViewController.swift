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
		label.font = UIFont(name: "seguisym", size: 100)
		label.font = label.font.withSize(100.0)
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
		label.font = UIFont(name: "seguisym", size: 20)
		label.font = label.font.withSize(20.0)
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
			self.flyportLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
			self.flyportLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			self.flyportLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			self.flyportLabel.heightAnchor.constraint(equalToConstant: 110.0)
		])
	}
	
	private func activateFlyportSubtitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.flyportSubtitleLabel.topAnchor.constraint(equalTo: self.flyportLabel.bottomAnchor, constant: 32.0),
			self.flyportSubtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			self.flyportSubtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			self.flyportSubtitleLabel.heightAnchor.constraint(equalToConstant: 24.0)
		])
	}
	
	private func activateFlyportLogoConstraints() {
		NSLayoutConstraint.activate([
			self.flyportLogo.topAnchor.constraint(equalTo: self.flyportSubtitleLabel.bottomAnchor, constant: 125.0),
			self.flyportLogo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 104.5),
			self.flyportLogo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -104.5)
		])
	}
}
