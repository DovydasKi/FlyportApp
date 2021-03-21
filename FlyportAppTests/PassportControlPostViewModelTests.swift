//
//  PassportControlPostViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class PassportControlPostViewModelTests: XCTestCase {
	
	public func testFlightNumberTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.flightNumber, "11")
	}
	
	public func testYourPassportTableTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.yourPassportControlPost.localized()
		
		XCTAssertEqual(viewModel.yourPassportControlTable, expectedResult)
	}
	
	public func testtableNumberTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.tableNumber, "1")
	}
	
	public func testNavigateToTableTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.navigateToPassport.localized()
		
		XCTAssertEqual(viewModel.navigateToTable, expectedResult)
	}
	
	public func testShowQRCodeTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.showQR.localized()
		
		XCTAssertEqual(viewModel.showQRCode, expectedResult)
	}
	
	public func testMoveToNextProcedureTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.moveToNextProcedure.localized()
		
		XCTAssertEqual(viewModel.moveToNextProcedure, expectedResult)
	}
	
	public func testErrorTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testRouteTitle() {
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11", fromCity: "Vilnius", toCity: "Riga")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo)
		
		XCTAssertEqual(viewModel.route, "Vilnius - Riga")
	}
	
	public func testGetBoardingGatesInfoWhenResponseIsNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let serviceMock = AirportPointServiceMock(point: nil)
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getBoardingGatesInfo(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetBoardingGatesInfoWhenResponseIsNotNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let serviceMock = AirportPointServiceMock(point: point)
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getBoardingGatesInfo(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.airportPointId, 1)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testCompleteVisit() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let flightInfo = self.flightInfo(id: 11, flightNumber: "11")
		let point = self.airportPoint(id: 1, pointNumber: "1")
		let serviceMock = AirportPointServiceMock(point: nil)
		let viewModel = PassportControlPostViewModel(point: point, info: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.completePassportTableVisit {
			expectation.fulfill()
			XCTAssertTrue(true)
		}
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension PassportControlPostViewModelTests {
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

private class AirportPointServiceMock: AirportPointService {
	private let point: AirportPointModel?
	
	init(point: AirportPointModel?) {
		self.point = point
	}
	
	override func getBoardingGates(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		completion(point)
	}
}
