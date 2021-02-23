//
//  QRCodeViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class QRCodeViewModel {
	private static let yourCodeTitle: String = "Your QR code"
	private static let hideCodeTitle: String = "Hide QR code"
}

extension QRCodeViewModel {
	public var yourCodeTitle: String {
		return type(of: self).yourCodeTitle
	}
	
	public var hideCodeTitle: String {
		return type(of: self).hideCodeTitle
	}
}
