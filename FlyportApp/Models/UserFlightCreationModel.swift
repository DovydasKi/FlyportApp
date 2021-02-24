//
//  UserFlightCreationModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserFlightCreationModel: Codable {
	public let userId: Int
	public let flightId: Int
	
	public init(userId: Int, flightId: Int) {
		self.userId = userId
		self.flightId = flightId
	}
}
