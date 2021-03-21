//
//  BoardingGatesViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class BoardingGatesViewModelTests: XCTestCase {
	
	public func testFlightNumberTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.flightNumber, "11")
	}
	
	public func testYourBoardingGatesTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.yourBoardingGates.localized()
		
		XCTAssertEqual(viewModel.yourBoardingGates, expectedResult)
	}
	
	public func testTableNumberTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.tableNumber, "1")
	}
	
	public func testNavigateToTableTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.navigateToBoarding.localized()
		
		XCTAssertEqual(viewModel.navigateToTable, expectedResult)
	}
	
	public func testFinishTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.finish.localized()
		
		XCTAssertEqual(viewModel.finish, expectedResult)
	}
	
	public func testErrorTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testRouteTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11", fromCity: "Vilnius", toCity: "Riga")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = BoardingGatesViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.route, "Vilnius - Riga")
	}
}

extension BoardingGatesViewModelTests {
	private func flightInfo(id: Int, flightNumber: String, fromCity: String = "", toCity: String = "") -> FlightInfoModel {
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
}
