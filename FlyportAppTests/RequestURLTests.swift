//
//  RequestURLTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class RequestURLTests: XCTestCase {
	public func testLoginUrl() {
		let requests = RequestURL()
		let url = requests.loginUrl()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/login")
	}
	
	public func testRegisterUrl() {
		let requests = RequestURL()
		let url = requests.registerURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/registration")
	}
	
	public func testProfileInfoUrl() {
		let requests = RequestURL()
		let url = requests.profileInfoURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/profile/0")
	}
	
	public func testUserFlightsUrl() {
		UserDefaults.standard.setUserId(value: 111)
		let requests = RequestURL()
		let url = requests.userFlightsURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/flights/111")
	}
	
	public func testFlightPointsUrl() {
		let requests = RequestURL()
		let url = requests.flightPointsURL(flightId: 3)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/flights/airportPoints/3")
	}
	
	public func testUpdateProfileUrl() {
		UserDefaults.standard.setUserId(value: 111)
		let requests = RequestURL()
		let url = requests.updateProfileURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/profile/111")
	}
	
	public func testSearchFlightUrl() {
		let requests = RequestURL()
		let url = requests.searchFlightURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/flights/search")
	}
	
	public func testRegisterUserFlightUrl() {
		let requests = RequestURL()
		let url = requests.registerUserFlightURL()
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight")
	}
	
	public func testCompleteFlightUrl() {
		let requests = RequestURL()
		let url = requests.completeFlightURL(userFlightId: 3)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight/3/complete")
	}
	
	public func testBoardingGateUrl() {
		let requests = RequestURL()
		let url = requests.boardingGatesURL(userFlightId: 4)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight/4/point/boarding")
	}
	
	public func testPassportPointUrl() {
		let requests = RequestURL()
		let url = requests.passportPointURL(userFlightId: 4)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight/4/point/boarding")
	}
	
	public func testRegistrationpointUrl() {
		let requests = RequestURL()
		let url = requests.registrationPointURL(userFlightId: 4)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight/4/point/registration")
	}
	
	public func testSecurityPointUrl() {
		let requests = RequestURL()
		let url = requests.securityPointURL(userFlightId: 5)
		
		XCTAssertEqual(url.absoluteString, "https://flyportbackend.azurewebsites.net/user/flight/5/point/security")
	}
}
