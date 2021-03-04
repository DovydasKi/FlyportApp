//
//  MapTypeEnum.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-03-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import CoreLocation

public enum MapTypeEnum {
	case registration
	case aviationSecurity
	case passport
	case boarding
	
	public var titleText: String {
		switch self {
		case .registration:
			return "Your registration table"
		case .aviationSecurity:
			return "Your aviation security post"
		case .passport:
			return "Your passport control post"
		case .boarding:
			return "Your boarding gate"
		}
	}
	
	public var routeCoordinates: [CLLocationCoordinate2D] {
		switch self {
		case .registration:
			return [
				CLLocationCoordinate2D(latitude: 54.643029590482826, longitude: 25.28057315783452),
				CLLocationCoordinate2D(latitude: 54.64303654466328, longitude: 25.28143158838899),
				CLLocationCoordinate2D(latitude: 54.643117254328494, longitude: 25.281437623359334),
				CLLocationCoordinate2D(latitude: 54.64311764235536, longitude: 25.281544911720918)
			]
		case .aviationSecurity:
			return [
				CLLocationCoordinate2D(latitude: 54.643029590482826, longitude: 25.28057315783452),
				CLLocationCoordinate2D(latitude: 54.64303337769221, longitude: 25.281518785164042),
				CLLocationCoordinate2D(latitude: 54.643074120575285, longitude: 25.28173202078269),
				CLLocationCoordinate2D(latitude: 54.64307567268465, longitude: 25.28192916314455)
			]
		case .passport:
			return [
				CLLocationCoordinate2D(latitude: 54.643029590482826, longitude: 25.28057315783452),
				CLLocationCoordinate2D(latitude: 54.64303337769221, longitude: 25.281518785164042),
				CLLocationCoordinate2D(latitude: 54.643074120575285, longitude: 25.28173202078269),
				CLLocationCoordinate2D(latitude: 54.64307567268465, longitude: 25.28192916314455),
				CLLocationCoordinate2D(latitude: 54.64306540595012, longitude: 25.282217766047896),
				CLLocationCoordinate2D(latitude: 54.64307665874159, longitude: 25.282357240917957)
			]
		case .boarding:
			return [
				CLLocationCoordinate2D(latitude: 54.643029590482826, longitude: 25.28057315783452),
				CLLocationCoordinate2D(latitude: 54.64303337769221, longitude: 25.281518785164042),
				CLLocationCoordinate2D(latitude: 54.643074120575285, longitude: 25.28173202078269),
				CLLocationCoordinate2D(latitude: 54.64307567268465, longitude: 25.28192916314455),
				CLLocationCoordinate2D(latitude: 54.64306540595012, longitude: 25.282217766047896),
				CLLocationCoordinate2D(latitude: 54.64307665874159, longitude: 25.282357240917957),
				CLLocationCoordinate2D(latitude: 54.64314863972124, longitude: 25.282529167635097),
				CLLocationCoordinate2D(latitude: 54.643236799343875, longitude: 25.28250885435224),
				CLLocationCoordinate2D(latitude: 54.64333024833516, longitude: 25.28271503417325)
			]
		}
	}
	
	public var destinationTitle: String {
		switch self {
		case .aviationSecurity:
			return "Your aviation security point: "
		case .boarding:
			return "Your boarding gates: "
		case .passport:
			return "Your passport check point: "
		case .registration:
			return "Your registration table: "
		}
	}
}
