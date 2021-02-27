//
//  QRCodeViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-27.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class QRCodeViewController: UIViewController {
	private let viewModel: QRCodeViewModel
	private lazy var screenTitle: UILabel = self.initLabel()
	private lazy var qrCode: UIImageView = self.initQR()
	private lazy var hideButton: UIButton = self.initButton()
	
	public init(viewModel: QRCodeViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		self.view.addSubview(self.screenTitle)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.qrCode)
		self.activateQRCodeConstraints()
		self.view.addSubview(self.hideButton)
		self.activateCompleteHideButtonConstraints()
	}
	
	@objc private func returnToPrevious() {
		self.navigationController?.popViewController(animated: true)
	}
}

extension QRCodeViewController {
	private func initQR() -> UIImageView {
		var image = UIImage()
		let data = self.viewModel.getRegistrationTableQRDate()
		let filter = CIFilter(name: "CIQRCodeGenerator")
		filter?.setValue(data, forKey: "inputMessage")
		let transform = CGAffineTransform(scaleX: 10, y: 10)
		if let output = filter?.outputImage?.transformed(by: transform) {
			image = UIImage(ciImage: output)
		}
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: 166, height: 166)
		return imageView
	}
	
	private func initLabel() -> UILabel {
		let label = UILabel()
		label.text = self.viewModel.yourCodeTitle
		label.font = UIFont(name: "seguisym", size: UIView.margin(of: [30,40,45]))
		label.font = label.font.withSize(UIView.margin(of: [30,40,45]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initButton() -> UIButton {
		let button = UIButton()
		button.setTitle(self.viewModel.hideCodeTitle, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 30
		button.backgroundColor = .white
		button.titleLabel?.numberOfLines = 0
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.setTitleColor(UIColor(named: "ButtonColor"), for: .normal)
		button.addTarget(self, action: #selector(self.returnToPrevious), for: .touchUpInside)
		return button
	}
}

extension QRCodeViewController {
	private func activateTitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.screenTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [33,44,50])),
			self.screenTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.screenTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
		])
	}
	
	private func activateQRCodeConstraints() {
		NSLayoutConstraint.activate([
			self.qrCode.topAnchor.constraint(equalTo: self.screenTitle.bottomAnchor, constant: UIView.margin(of: [95, 130, 150])),
			self.qrCode.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.qrCode.heightAnchor.constraint(equalToConstant: UIView.margin(of: [210, 280, 300])),
			self.qrCode.widthAnchor.constraint(equalToConstant: UIView.margin(of: [210, 280, 300]))
		])
	}
	
	private func activateCompleteHideButtonConstraints() {
		NSLayoutConstraint.activate([
			self.hideButton.topAnchor.constraint(equalTo: self.qrCode.bottomAnchor, constant: UIView.margin(of: [45, 60, 65])),
			self.hideButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [33, 44, 50])),
			self.hideButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -UIView.margin(of: [33, 44, 50])),
			self.hideButton.heightAnchor.constraint(equalToConstant: UIView.margin(of: [60,80,90]))
		])
	}
}
