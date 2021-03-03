//
//  MapViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-03-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import CoreLocation

public class MapViewModel {
	public let title: String
	public let number: String
	public let coordinates: [CLLocationCoordinate2D]
	
	public init(number: String, mapType: MapTypeEnum) {
		self.number = number
		self.title = mapType.titleText
		self.coordinates = mapType.routeCoordinates
	}
}

