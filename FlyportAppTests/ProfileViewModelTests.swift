//
//  ProfileViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class ProfileViewModelTests: XCTestCase {
	public func testProfileTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.profile.localized()
		
		XCTAssertEqual(viewModel.profile, expectedResult)
	}
	
	public func testPasswordTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.password.localized()
		
		XCTAssertEqual(viewModel.password, expectedResult)
	}
	
	public func testRepeatPasswordTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.repeatPassword.localized()
		
		XCTAssertEqual(viewModel.repeatPassword, expectedResult)
	}
	
	public func testSuccessfulUpdateTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.successfulUpdateTitle.localized()
		
		XCTAssertEqual(viewModel.successfulUpdate, expectedResult)
	}
	
	public func testSuccessfulUpdateSubtitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.successfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.successfulUpdateSubtitle, expectedResult)
	}
	
	public func testOkTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.ok.localized()
		
		XCTAssertEqual(viewModel.ok, expectedResult)
	}
	
	public func testUnsuccessfulUpdateTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulUpdateTitle.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulUpdate, expectedResult)
	}
	
	public func testUnsuccessfulUpdateSubtitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulUpdateMessage, expectedResult)
	}
	
	public func testTryAgainTitle() {
		let viewModel = ProfileViewModel()
		let expectedResult = LocalizationKeys.tryAgain.localized()
		
		XCTAssertEqual(viewModel.tryAgain, expectedResult)
	}
	
	public func testFullName() {
		let personalInfo = self.personalInfo(name: "Name", surname: "Surname")
		UserDefaults.standard.setPersonalInfo(value: personalInfo)
		let viewModel = ProfileViewModel()
		let expectedResult = "Name Surname"
		
		XCTAssertEqual(viewModel.fullName, expectedResult)
	}
	
	public func testCheckValidationWhenAllFieldsAreCorrect() {
		let viewModel = ProfileViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let documentField = UITextField()
		documentField.text = "111111111111"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "password"
		
		let result = viewModel.checkValidation(email: emailField, document: documentField, password: passwordField, repeatPassword: repeatPasswordField)
		
		XCTAssertTrue(result)
	}
	
	public func testCheckValidationWhenEmailFieldIsNotValid() {
		let viewModel = ProfileViewModel()
		let emailField = UITextField()
		emailField.text = ""
		let documentField = UITextField()
		documentField.text = "111111111111"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "password"
		
		let result = viewModel.checkValidation(email: emailField, document: documentField, password: passwordField, repeatPassword: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testCheckValidationWhenDocumentNumberFieldIsNotValid() {
		let viewModel = ProfileViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let documentField = UITextField()
		documentField.text = "111111"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "password"
		
		let result = viewModel.checkValidation(email: emailField, document: documentField, password: passwordField, repeatPassword: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testCheckValidationWhenPasswordFieldIsNotValid() {
		let viewModel = ProfileViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let documentField = UITextField()
		documentField.text = "111111111111"
		let passwordField = UITextField()
		passwordField.text = "pas"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "pas"
		
		let result = viewModel.checkValidation(email: emailField, document: documentField, password: passwordField, repeatPassword: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testCheckValidationWhenRepeatPasswordFieldIsNotValid() {
		let viewModel = ProfileViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let documentField = UITextField()
		documentField.text = "111111111111"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "passwrd"
		
		let result = viewModel.checkValidation(email: emailField, document: documentField, password: passwordField, repeatPassword: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testUpdateLocalDataPassword() {
		let viewModel = ProfileViewModel()
		let email = "email@email.com"
		let password = "password"
		UserDefaults.standard.setLoginInfo(value: UserLoginInfoModel(email: email, password: "000"))
		
		viewModel.updateLocalData(document: nil, email: nil, password: password)
		let result = UserDefaults.standard.getLoginInfo().password
		
		XCTAssertEqual(result, password)
	}
	
	public func testUpdateLocalDataDocumentNumber() {
		let viewModel = ProfileViewModel()
		let email = "newemail@email.com"
		let password = "password"
		let documentNumber = "123456"
		let personalInfo = self.personalInfo(name: "name", surname: "surname")
		UserDefaults.standard.setLoginInfo(value: UserLoginInfoModel(email: "email@email.com", password: "000"))
		UserDefaults.standard.setPersonalInfo(value: personalInfo)
		
		viewModel.updateLocalData(document: documentNumber, email: email, password: password)
		let documentResult = UserDefaults.standard.getPersonalInfo().documentNumber
		let emailResult = UserDefaults.standard.getLoginInfo().email
		
		XCTAssertEqual(documentResult, documentNumber)
		XCTAssertEqual(emailResult, email)
	}
	
	public func testUpdateToServiceDocumentNumberIsNil() {
		let viewModel = ProfileViewModel()
		let expectation = self.expectation(description: "completion block")

		viewModel.updateToService(document: nil, email: "email@email.com", password: "password", completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testUpdateToServiceWhenResponseFromServiceIsFalse() {
		let serviceMock = LoginServiceMock(updateResponse: false)
		let viewModel = ProfileViewModel(service: serviceMock)
		let expectation = self.expectation(description: "completion block")

		viewModel.updateToService(document: "1111", email: "email@email.com", password: "password", completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testUpdateToServiceWhenResponseFromServiceIsTrue() {
		let serviceMock = LoginServiceMock(updateResponse: true)
		let viewModel = ProfileViewModel(service: serviceMock)
		let expectation = self.expectation(description: "completion block")

		viewModel.updateToService(document: "1111", email: "email@email.com", password: "password", completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testUpdateToServiceWhenResponseFromServiceIsTrueButPasswordIsNil() {
		let serviceMock = LoginServiceMock(updateResponse: true)
		let viewModel = ProfileViewModel(service: serviceMock)
		let expectation = self.expectation(description: "completion block")

		viewModel.updateToService(document: "1111", email: "email@email.com", password: nil, completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

extension ProfileViewModelTests {
	private func personalInfo(name: String, surname: String) -> UserPersonalInfoModel {
		return UserPersonalInfoModel(
			name: name,
			surname: surname,
			personalCode: "1111",
			documentNumber: "22222"
		)
	}
}

private class LoginServiceMock: LoginService {
	private let updateResponse: Bool
	
	init(updateResponse: Bool) {
		self.updateResponse = updateResponse
	}
	
	override func updateProfile(data: Data, completion: @escaping (Bool) -> Void) {
		completion(updateResponse)
	}
}
