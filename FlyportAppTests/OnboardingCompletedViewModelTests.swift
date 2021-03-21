//
//  OnboardingCompletedViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class OnboardingCompletedViewModelTests: XCTestCase {
	
	public func testCongratsTitle() {
		let viewModel = OnboardingCompletedViewModel()
		let expectedResult = LocalizationKeys.congrats.localized()
		
		XCTAssertEqual(viewModel.congratsTitle, expectedResult)
	}
	
	public func testCongratsSubtitle() {
		let viewModel = OnboardingCompletedViewModel()
		let expectedResult = LocalizationKeys.readyForFlight.localized()
		
		XCTAssertEqual(viewModel.congratsSubtitle, expectedResult)
	}
	
	public func testErrorTitle() {
		let viewModel = OnboardingCompletedViewModel()
		let expectedResult = LocalizationKeys.error.localized()
		
		XCTAssertEqual(viewModel.errorTitle, expectedResult)
	}
	
	public func testErrorSubtitle() {
		let viewModel = OnboardingCompletedViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.errorSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let viewModel = OnboardingCompletedViewModel()
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testCompletedFlightWhenResponseIsFalse() {
		let serviceMock = UserFlightsServiceMock(isCompleted: false)
		let viewModel = OnboardingCompletedViewModel(service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.completeFlight(completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testCompletedFlightWhenResponseIsTrue() {
		let serviceMock = UserFlightsServiceMock(isCompleted: true)
		let viewModel = OnboardingCompletedViewModel(service: serviceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.completeFlight(completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

private class UserFlightsServiceMock: UserFlightsService {
	private let isCompleted: Bool
	
	init(isCompleted: Bool) {
		self.isCompleted = isCompleted
	}
	
	override func completeUserFlight(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		completion(isCompleted)
	}
}
