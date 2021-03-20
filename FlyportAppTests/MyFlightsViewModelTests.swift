//
//  MyFlightsViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-19.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class MyFlightsViewModelTests: XCTestCase {
	
	public func testMyFlightsText() {
		let viewModel = MyFlightsViewModel()
		let expectedResult = LocalizationKeys.myFlights.localized()
		
		XCTAssertEqual(viewModel.myFlights, expectedResult)
	}
	
	public func testNewFlightText() {
		let viewModel = MyFlightsViewModel()
		let expectedResult = LocalizationKeys.newFlight.localized()
		
		XCTAssertEqual(viewModel.newFlight, expectedResult)
	}
	
	public func testGetFlightsDataWhenFlightsModelIsNil() {
		let model = self.userFlightsModel(userFlight: nil)
		let userFlightsMock = UserFlightsServiceMock(userFlightsModelStub: model)
		let viewModel = MyFlightsViewModel(service: userFlightsMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getFlightsData(completion: {
			result in expectation.fulfill()
			XCTAssertNil(result)
		})

		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetFlightsDataWhenFlightsModelIsNotNil() {
		let firstUserFlight = self.userFlightModel(id: 111)
		let secondUserFlight = self.userFlightModel(id: 345)
		let model = self.userFlightsModel(userFlight: [firstUserFlight, secondUserFlight])
		let userFlightsMock = UserFlightsServiceMock(userFlightsModelStub: model)
		let viewModel = MyFlightsViewModel(service: userFlightsMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getFlightsData(completion: {
			result in expectation.fulfill()
			if let modelFromMock = result {
				XCTAssertEqual(modelFromMock.flights.count, 2)
				XCTAssertEqual(modelFromMock.flights[0].userFlightId, 111)
				XCTAssertEqual(modelFromMock.flights[1].userFlightId, 345)
			}
		})

		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension MyFlightsViewModelTests {
	private func userFlightsModel(userFlight: [UserFlightModel]?) -> UserFlightsModel? {
		if let model = userFlight {
			return UserFlightsModel(flights: model)
		} else {
			return nil
		}
	}
	
	private func userFlightModel(id: Int) -> UserFlightModel {
		return UserFlightModel(
			userFlightId: id,
			completed: true,
			flightId: 0,
			flightNumber: "0",
			flightDate: "2020-01-01",
			airlines: "GetJet airlines",
			fromCity: "Vilnius",
			toCity: "Vilnius"
		)
	}
}

private class UserFlightsServiceMock: UserFlightsService {
	private let userFlightsModelStub: UserFlightsModel?
	
	init(userFlightsModelStub: UserFlightsModel?) {
		self.userFlightsModelStub = userFlightsModelStub
	}
	
	override func getUserFlightsData(completion: @escaping (UserFlightsModel?) -> Void) {
		completion(self.userFlightsModelStub)
	}
}
