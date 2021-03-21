//
//  MapViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class MapViewModelTests: XCTestCase {
	public func testInit() {
		let viewModel = MapViewModel(number: "123", mapType: .registration)
		
		XCTAssertEqual(viewModel.title, LocalizationKeys.yourRegistrationTable.localized())
		XCTAssertEqual(viewModel.number, "123")
		XCTAssertEqual(viewModel.destinationTitle, LocalizationKeys.yourRegistrationTable.localized() + "123")
		XCTAssertEqual(viewModel.coordinates.count, 4)
	}
}
