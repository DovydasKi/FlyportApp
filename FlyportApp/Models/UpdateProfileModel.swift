//
//  UpdateProfileModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-18.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UpdateProfileModel: Codable {
	public let documentNumber: String
	public let email: String
	public let password: String
	
	public init(documentNumber: String, email: String, password: String) {
		self.documentNumber = documentNumber
		self.email = email
		self.password = password
	}
}
