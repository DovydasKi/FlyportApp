//
//  LoginViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-19.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class LoginViewModelTests: XCTestCase {
	
	public func testAppTitle() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.flyPortTitle.localized()
		
		XCTAssertEqual(viewModel.appTitle, expectedResult)
	}
	
	public func testEmail() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.email.localized()
		
		XCTAssertEqual(viewModel.email, expectedResult)
	}
	
	public func testPassword() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.password.localized()
		
		XCTAssertEqual(viewModel.password, expectedResult)
	}
	
	public func testRegisterTitle() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.registerTitle.localized()
		
		XCTAssertEqual(viewModel.registerTitle, expectedResult)
	}
	
	public func testUnsuccessfulLoginTitle() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulLoginTitle.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulLogin, expectedResult)
	}
	
	public func testUnsuccessfulLoginMessageTitle() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulLoginMessage.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulLoginMessage, expectedResult)
	}
	
	public func testTryAgainTitle() {
		let viewModel = LoginViewModel()
		let expectedResult = LocalizationKeys.tryAgain.localized()
		
		XCTAssertEqual(viewModel.tryAgain, expectedResult)
	}
	
	public func testInputFieldsValidationWhenEmailIsNotValid() {
		let viewModel = LoginViewModel()
		
		let emailField = UITextField()
		emailField.text = "email"
		
		let passwordField = UITextField()
		passwordField.text = "password"
		
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField)
		
		XCTAssertFalse(result)
	}
	
	public func testInputFieldsValidationWhenPasswordIsNotValid() {
		let viewModel = LoginViewModel()
		
		let emailField = UITextField()
		emailField.text = "email@email.com"
		
		let passwordField = UITextField()
		passwordField.text = "pas"
		
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField)
		
		XCTAssertFalse(result)
	}
	
	public func testInputFieldsValidationWhenBothFieldAreValidValid() {
		let viewModel = LoginViewModel()
		
		let emailField = UITextField()
		emailField.text = "email@email.com"
		
		let passwordField = UITextField()
		passwordField.text = "password"
		
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField)
		
		XCTAssertTrue(result)
	}
	
	public func testLoginToServiceWhenOneOfTheFieldsAreEmpty() {
		let viewModel = LoginViewModel()
		let expectation = self.expectation(description: "completion block")
		
		viewModel.loginToService(emailText: nil, passwordText: "password") {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		}
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testLoginToServiceWhenLoginResponseIsNil() {
		let loginServiceMock = LoginServiceMock(loginResponse: nil, profile: nil)
		let viewModel = LoginViewModel(service: loginServiceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.loginToService(emailText: "email@email.lt", passwordText: "password") {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		}
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testLoginToServiceWhenLoginResponseIsNotNil() {
		let loginResponse = self.loginResponse(id: 5)
		let loginServiceMock = LoginServiceMock(loginResponse: loginResponse, profile: nil)
		let viewModel = LoginViewModel(service: loginServiceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.loginToService(emailText: "email@email.lt", passwordText: "password") {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		}
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetUserProfileDataWhenResultIsNotNil() {
		let loginInfo = self.userLoginInfo()
		let personalInfo = self.userPersonalInfo()
		let userProfile = self.userProfile(login: loginInfo, personalInfo: personalInfo)
		let loginServiceMock = LoginServiceMock(loginResponse: nil, profile: userProfile)
		let viewModel = LoginViewModel(service: loginServiceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getUserProfileData(completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testGetUserProfileDataWhenResultIsNil() {
		let loginServiceMock = LoginServiceMock(loginResponse: nil, profile: nil)
		let viewModel = LoginViewModel(service: loginServiceMock)
		let expectation = self.expectation(description: "completion block")
		
		viewModel.getUserProfileData(completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension LoginViewModelTests {
	private func loginResponse(id: Int) -> LoginResponse {
		return LoginResponse(userId: id)
	}
	
	private func userLoginInfo() -> UserLoginInfoModel {
		return UserLoginInfoModel(
			email: "email@email.com",
			password: "password"
		)
	}
	
	private func userPersonalInfo() -> UserPersonalInfoModel {
		return UserPersonalInfoModel(
			name: "Name",
			surname: "Surname",
			personalCode: "111111111111",
			documentNumber: "2222222"
		)
	}
	
	private func userProfile(login: UserLoginInfoModel, personalInfo: UserPersonalInfoModel) -> UserProfileModel {
		return UserProfileModel(
			userLoginInfoModel: login,
			userPersonalInfoModel: personalInfo
		)
	}
}

private class LoginServiceMock: LoginService {
	private let loginResponse: LoginResponse?
	private let userProfile: UserProfileModel?
	
	init(loginResponse: LoginResponse?, profile: UserProfileModel?) {
		self.loginResponse = loginResponse
		self.userProfile = profile
	}
	
	override func getProfileData(completion: @escaping (UserProfileModel?) -> Void) {
		completion(self.userProfile)
	}
	
	override func login(data: Data, completion: @escaping (LoginResponse?) -> Void) {
		completion(self.loginResponse)
	}
}
