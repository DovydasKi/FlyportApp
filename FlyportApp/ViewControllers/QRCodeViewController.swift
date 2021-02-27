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
	private lazy var qrCode: UIImageView = self.initQR()
	
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
		self.view.addSubview(self.qrCode)
		self.activateQRCodeConstraints()
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
}

extension QRCodeViewController {
	private func activateQRCodeConstraints() {
		NSLayoutConstraint.activate([
			self.qrCode.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: UIView.margin(of: [210, 280, 300])),
			self.qrCode.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.qrCode.heightAnchor.constraint(equalToConstant: UIView.margin(of: [210, 280, 300])),
			self.qrCode.widthAnchor.constraint(equalToConstant: UIView.margin(of: [210, 280, 300]))
		])
	}
}
