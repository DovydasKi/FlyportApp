//
//  AviationSecurityViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-14.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class AviationSecurityViewModelTests: XCTestCase {
	public func testGettingPassportPointInfoWhenResponseIsNil() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let airportPointService = AirportPointsServiceMock(airportPointModelStub: nil, expectedResult: true)
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo, service: airportPointService)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getPassportPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGettingPassportPointInfoWhenResponseIsNotNil() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let airportPointService = AirportPointsServiceMock(airportPointModelStub: airportPoint, expectedResult: true)
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo, service: airportPointService)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getPassportPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.airportPointId, 1)
			XCTAssertEqual(result?.pointNumber, "22D")
			XCTAssertEqual(result?.type, "P")
		})
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGettingboardingGatesInfoWhenResponseIsNotNil() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let airportPointService = AirportPointsServiceMock(airportPointModelStub: airportPoint, expectedResult: true)
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo, service: airportPointService)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getBoardingGatesInfo(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.airportPointId, 1)
			XCTAssertEqual(result?.pointNumber, "22D")
			XCTAssertEqual(result?.type, "P")
		})
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGettingBoardingGatesInfoWhenResponseIsNil() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let airportPointService = AirportPointsServiceMock(airportPointModelStub: nil, expectedResult: true)
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo, service: airportPointService)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getBoardingGatesInfo(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testRouteText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = "Vilnius - Vilnius"
		XCTAssertEqual(viewModel.route, expectedResult)
	}
	
	public func testFlightNumberText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = "WW2233"
		XCTAssertEqual(viewModel.flightNumber, expectedResult)
	}
	
	public func testYourAviationSecurityTableText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.yourAviationSecurityPost.localized()
		XCTAssertEqual(viewModel.yourAviationSecurityTable, expectedResult)
	}
	
	public func testTableNumberText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = "22D"
		XCTAssertEqual(viewModel.tableNumber, expectedResult)
	}
	
	public func testNavigateToTableText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.navigateToSecurity.localized()
		XCTAssertEqual(viewModel.navigateToTable, expectedResult)
	}
	
	public func testMoveToNextProcedureText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.moveToNextProcedure.localized()
		XCTAssertEqual(viewModel.moveToNextProcedure, expectedResult)
	}
	
	public func testErrorText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.error.localized()
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitleText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkText() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo)
		
		let expectedResult = LocalizationKeys.ok.localized()
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testCompleteAviationSecurityTableVisit() {
		let airportPoint = self.airportPoint(id: 1, pointNumber: "22D", type: "P")
		let flightInfo = self.flightInfo(from: "Vilnius", to: "Vilnius", number: "WW2233")
		let airportPointService = AirportPointsServiceMock(airportPointModelStub: nil, expectedResult: true)
		let viewModel = AviationSecurityViewModel(point: airportPoint, info: flightInfo, service: airportPointService)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.completeAviationSecurityTableVisit {
			expectation.fulfill()
			XCTAssertTrue(true)
		}
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension AviationSecurityViewModelTests {
	private func airportPoint(id: Int, pointNumber: String, type: String) -> AirportPointModel {
		return AirportPointModel(
			airportPointId: id,
			type: type,
			pointNumber: pointNumber)
	}
	
	private func flightInfo(from: String, to: String, number: String) -> FlightInfoModel {
		return FlightInfoModel(
			flightId: 1,
			flightNumber: number,
			flightDate: "2000-01-01",
			airlines: "Wizzair",
			fromCity: from,
			toCity: to,
			passportControl: true)
	}
}

private class AirportPointsServiceMock: AirportPointService {
	private let airportPointModelStub: AirportPointModel?
	private let expectedResult: Bool
	
	init(airportPointModelStub: AirportPointModel?, expectedResult: Bool) {
		self.airportPointModelStub = airportPointModelStub
		self.expectedResult = expectedResult
	}
	
	override func getPassportPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		completion(self.airportPointModelStub)
	}
	
	override func getBoardingGates(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		completion(self.airportPointModelStub)
	}
	
	override func completeSecurityPointVisit(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		completion(self.expectedResult)
	}
}
