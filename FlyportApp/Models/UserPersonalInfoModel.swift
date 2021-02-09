//
//  UserPersonalInfoModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-09.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserPersonalInfoModel: Decodable {
	public var name: String
	public var surname: String
	public var personalCode: String
	public var documentNumber: String
	
	public init (name: String, surname: String, personalCode: String, documentNumber: String) {
		self.name = name
		self.surname = surname
		self.personalCode = personalCode
		self.documentNumber = documentNumber
	}
}
