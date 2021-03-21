//
//  SelectedFlightViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class SelectedFlightViewModelTests: XCTestCase {
	
	public func testYourFlightTitle() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.yourSelectedFlight.localized()
		
		XCTAssertEqual(viewModel.youtFlightTitle, expectedResult)
	}
	
	public func testFullRouteTitle() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222", fromCity: "Vilnius", toCity: "Riga")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		
		XCTAssertEqual(viewModel.fullRoute, "Vilnius - Riga")
	}
	
	public func testErrorTitle() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testGetFlightInfo() {
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo)
		
		XCTAssertEqual(viewModel.getFlightInfo().flightId, 1)
	}
	
	public func testRegisterFlightWhenResponseIsNil() {
		let serviceMock = UserFlightsServiceMock(userFlightCreationResponseStub: nil)
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.registerFlight(completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testRegisterFlightWhenResponseIsNotNil() {
		let responseStub = self.registerResponse(id: 333)
		let serviceMock = UserFlightsServiceMock(userFlightCreationResponseStub: responseStub)
		let flightInfo = self.flightInfo(id: 1, flightNumber: "222")
		let viewModel = SelectedFlightViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.registerFlight(completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension SelectedFlightViewModelTests {
	private func flightInfo(id: Int, flightNumber: String, fromCity: String = "", toCity: String = "", flightDate: String = "") -> FlightInfoModel {
		return FlightInfoModel(
			flightId: id,
			flightNumber: flightNumber,
			flightDate: "",
			airlines: "",
			fromCity: fromCity,
			toCity: toCity,
			passportControl: true
		)
	}
	
	private func airportPoint(id: Int, pointNumber: String) -> AirportPointModel {
		return AirportPointModel(airportPointId: id, type: "", pointNumber: pointNumber)
	}
	
	private func registerResponse(id: Int) -> UserFlightCreationResponseModel {
		return UserFlightCreationResponseModel(userFlightId: id)
	}
}

private class UserFlightsServiceMock: UserFlightsService {
	private let userFlightCreationResponseStub: UserFlightCreationResponseModel?
	
	init(userFlightCreationResponseStub: UserFlightCreationResponseModel?) {
		self.userFlightCreationResponseStub = userFlightCreationResponseStub
	}
	
	override func registerUserFlight(data: Data, completion: @escaping (UserFlightCreationResponseModel?) -> Void) {
		completion(userFlightCreationResponseStub)
	}
}
