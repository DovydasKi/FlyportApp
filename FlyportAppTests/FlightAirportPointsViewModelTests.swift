//
//  FlightAirportPointsViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-20.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class FlightAirportPointsViewModelTests: XCTestCase {
	
	public func testRegistrationTableTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = LocalizationKeys.registrationTable.localized()
		
		XCTAssertEqual(viewModel.registrationTableTitle, expectedResult)
	}
	
	public func testAviationSecurityPostTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = LocalizationKeys.aviationSecurityPost.localized()
		
		XCTAssertEqual(viewModel.aviationSecurityPostTitle, expectedResult)
	}
	
	public func testPassportControlPostTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = LocalizationKeys.passportControlPost.localized()
		
		XCTAssertEqual(viewModel.passportControlPostTitle, expectedResult)
	}
	
	public func testBoardingGatesTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = LocalizationKeys.boardingGates.localized()
		
		XCTAssertEqual(viewModel.boardingGatesTitle, expectedResult)
	}
	
	public func testRegistrationTableImageTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = "Registration"
		
		XCTAssertEqual(viewModel.registrationTableImage, expectedResult)
	}
	
	public func testAviationSecurityPostImageTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = "SecurityPoint"
		
		XCTAssertEqual(viewModel.aviationSecurityPostImage, expectedResult)
	}
	
	public func testPassportControlPostImageTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = "PassportControl"
		
		XCTAssertEqual(viewModel.passportControlPostImage, expectedResult)
	}
	
	public func testBoardingGatesImageTitle() {
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "")
		let expectedResult = "BoardingGates"
		
		XCTAssertEqual(viewModel.boardingGatesImage, expectedResult)
	}
	
	public func testGetFlightsWhenReturnedValueIsNil() {
		let serviceMock = UserFlightsServiceMock(airportPointsModel: nil)
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "", service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getFlightsData(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetFlightsWhenReturnedValueIsNotNil() {
		let registration = self.point(number: "1")
		let passport = self.point(number: "2")
		let security = self.point(number: "3")
		let boarding = self.point(number: "4")
		let pointsModel = self.points(registration: registration, security: security, passport: passport, boarding: boarding)
		let serviceMock = UserFlightsServiceMock(airportPointsModel: pointsModel)
		let viewModel = FlightAirportPointsViewModel(flightId: 0, image: UIImage(), route: "", flightNumber: "", service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getFlightsData(completion: {
			result in expectation.fulfill()
			XCTAssertEqual(result?.boardingGates?.pointNumber, "4")
			XCTAssertEqual(result?.securityPoint?.pointNumber, "3")
			XCTAssertEqual(result?.passportPoint?.pointNumber, "2")
			XCTAssertEqual(result?.registrationPoint?.pointNumber, "1")
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension FlightAirportPointsViewModelTests {
	private func points(registration: FlightAirportPointModel, security: FlightAirportPointModel, passport: FlightAirportPointModel, boarding: FlightAirportPointModel) -> FlightAirportPointsModel {
		return FlightAirportPointsModel(
			registrationPoint: registration,
			securityPoint: security,
			passportPoint: passport,
			boardingGates: boarding
		)
	}
	
	private func point(number: String) -> FlightAirportPointModel {
		return FlightAirportPointModel(pointNumber: number, type: "T")
	}
}

private class UserFlightsServiceMock: UserFlightsService {
	private let airportPointsModel: FlightAirportPointsModel?
	
	init(airportPointsModel: FlightAirportPointsModel?) {
		self.airportPointsModel = airportPointsModel
	}
	
	override func getAirportPointsData(flightId: Int, completion: @escaping (FlightAirportPointsModel?) -> Void) {
		completion(airportPointsModel)
	}
}
