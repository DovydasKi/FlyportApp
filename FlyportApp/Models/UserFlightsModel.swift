//
//  UserFlightsModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-09.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserFlightsModel: Decodable {
	public var flights: [UserFlightModel]
}
