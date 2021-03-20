//
//  TabBarViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-19.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class TabBarViewModelTests: XCTestCase {
	
	public func testProfileTitle() {
		let viewModel = TabBarViewModel()
		let expectedResult = LocalizationKeys.profile.localized()
		
		XCTAssertEqual(viewModel.profileTitle, expectedResult)
	}
	
	public func testMyFlightsTitle() {
		let viewModel = TabBarViewModel()
		let expectedResult = LocalizationKeys.myFlights.localized()
		
		XCTAssertEqual(viewModel.myFlightsTitle, expectedResult)
	}
	
	public func testSettingsTitle() {
		let viewModel = TabBarViewModel()
		let expectedResult = LocalizationKeys.settings.localized()
		
		XCTAssertEqual(viewModel.settingsTitle, expectedResult)
	}
}
