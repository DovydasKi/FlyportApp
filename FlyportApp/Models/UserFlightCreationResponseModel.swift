//
//  UserFlightCreationResponseModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserFlightCreationResponseModel: Decodable {
	public let userFlightId: Int
	
	public init(userFlightId: Int) {
		self.userFlightId = userFlightId
	}
}
