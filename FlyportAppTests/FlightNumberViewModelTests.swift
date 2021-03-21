//
//  FlightNumberViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class FlightNumberViewModelTests: XCTestCase {
	
	public func testEnterNumberTitle() {
		let viewModel = FlightNumberViewModel()
		let expectedResult = LocalizationKeys.enterFlightNumber.localized()
		
		XCTAssertEqual(viewModel.enterNumber, expectedResult)
	}
	
	public func testFlightNumberPlaceholderTitle() {
		let viewModel = FlightNumberViewModel()
		let expectedResult = LocalizationKeys.flightNumber.localized()
		
		XCTAssertEqual(viewModel.flightNumberPlaceholder, expectedResult)
	}
	
	public func testCheckIsNumberValidWhenFlightNumberValueIsInvalid() {
		let viewModel = FlightNumberViewModel()
		let flightNumberField = UITextField()
		flightNumberField.text = "1"
		
		let result = viewModel.checkValidNumber(flightNumber: flightNumberField)
		XCTAssertFalse(result)
	}
	
	public func testCheckIsNumberValidWhenFlightNumberValueIsValid() {
		let viewModel = FlightNumberViewModel()
		let flightNumberField = UITextField()
		flightNumberField.text = "GW2233"
		
		let result = viewModel.checkValidNumber(flightNumber: flightNumberField)
		XCTAssertTrue(result)
	}
}
