//
//  FlightDateViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class FlightDateViewModelTests: XCTestCase {
	
	public func testEnterDateTitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.enterFlightDate.localized()
		
		XCTAssertEqual(viewModel.enterDate, expectedResult)
	}
	
	public func testFlightDatePlaceholderTitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.flightDate.localized()
		
		XCTAssertEqual(viewModel.flightDatePlaceholder, expectedResult)
	}
	
	public func testSelectTitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.select.localized()
		
		XCTAssertEqual(viewModel.select, expectedResult)
	}
	
	public func testErrorTitleTitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.flightInfoErrorSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testGetFlightNumber() {
		let viewModel = FlightDateViewModel(flightNumber: "112233")
		
		XCTAssertEqual(viewModel.getFlightNumber(), "112233")
	}
	
	public func testSearchFlightWhenResponseIsNil() {
		let serviceMock = UserFlightsServiceMock(flightInfoStub: nil)
		let viewModel = FlightDateViewModel(flightNumber: "1", service: serviceMock)
		let expectation = self.expectation(description: "completion block")

		viewModel.searchFlight(date: "2020-11-01", completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testSearchFlightWhenResponseIsNotNil() {
		let flightInfo = self.flightInfo(id: 123)
		let serviceMock = UserFlightsServiceMock(flightInfoStub: flightInfo)
		let viewModel = FlightDateViewModel(flightNumber: "1", service: serviceMock)
		let expectation = self.expectation(description: "completion block")

		viewModel.searchFlight(date: "2020-11-01", completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.flightId, 123)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testDateValidationWithIncorrectDate() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let textField = UITextField()
		textField.text = "2020-02-02"
		
		let result = viewModel.checkValidDate(dateTextField: textField)
		XCTAssertFalse(result)
	}
	
	public func testDateValidationWithCorrectDate() {
		let viewModel = FlightDateViewModel(flightNumber: "1")
		let textField = UITextField()
		textField.text = "2025-05-02"
		
		let result = viewModel.checkValidDate(dateTextField: textField)
		XCTAssertTrue(result)
	}
}

extension FlightDateViewModelTests {
	private func flightInfo(id: Int) -> FlightInfoModel {
		return FlightInfoModel(
			flightId: id,
			flightNumber: "",
			flightDate: "",
			airlines: "",
			fromCity: "",
			toCity: "",
			passportControl: true
		)
	}
}

private class UserFlightsServiceMock: UserFlightsService {
	private let flightInfoStub: FlightInfoModel?
	
	init(flightInfoStub: FlightInfoModel?) {
		self.flightInfoStub = flightInfoStub
	}
	
	override func flightsSearch(data: Data, completion: @escaping (FlightInfoModel?) -> Void) {
		completion(self.flightInfoStub)
	}
}
