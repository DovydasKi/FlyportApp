//
//  RegisteredLuggageViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class RegisteredLuggageViewModelTests: XCTestCase {
	
	public func testLuggageQuestionTitle() {
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.luggageQuestion.localized()
		
		XCTAssertEqual(viewModel.luggageQuestion, expectedResult)
	}
	
	public func testErrorTitle() {
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo)
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testGetRegistrationPointInfoWhenResponseIsNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let serviceMock = AirportPointServiceMock(point: nil)
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getRegistrationPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetRegistrationPointInfoWhenResponseIsNotNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let point = self.airportPoint(id: 999)
		let serviceMock = AirportPointServiceMock(point: point)
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getRegistrationPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.airportPointId, 999)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetSecurityPointInfoWhenResponseIsNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let serviceMock = AirportPointServiceMock(point: nil)
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getSecurityPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetSecurityPointInfoWhenResponseIsNotNil() {
		UserDefaults.standard.setUserFlightId(value: 123)
		let point = self.airportPoint(id: 999)
		let serviceMock = AirportPointServiceMock(point: point)
		let flightInfo = self.flightInfo(id: 11)
		let viewModel = RegisteredLuggageViewModel(flightInfo: flightInfo, service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getSecurityPointInfo(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.airportPointId, 999)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension RegisteredLuggageViewModelTests {
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
	
	private func airportPoint(id: Int) -> AirportPointModel {
		return AirportPointModel(airportPointId: id, type: "", pointNumber: "")
	}
}

private class AirportPointServiceMock: AirportPointService {
	private let point: AirportPointModel?
	
	init(point: AirportPointModel?) {
		self.point = point
	}
	
	override func getRegistrationPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		completion(point)
	}
	
	override func getSecurityPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		completion(point)
	}
}
