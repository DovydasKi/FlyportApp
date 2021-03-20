//
//  RegistrationViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-20.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class RegistrationViewModelTests: XCTestCase {
	
	public func testTitleText() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.flyPortTitle.localized()
		
		XCTAssertEqual(viewModel.title, expectedResult)
	}
	
	public func testUsernameTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.username.localized()
		
		XCTAssertEqual(viewModel.username, expectedResult)
	}
	
	public func testEmailTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.email.localized()
		
		XCTAssertEqual(viewModel.email, expectedResult)
	}
	
	public func testPasswordTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.password.localized()
		
		XCTAssertEqual(viewModel.password, expectedResult)
	}
	
	public func testRepeatPasswordTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.repeatPassword.localized()
		
		XCTAssertEqual(viewModel.repeatPassword, expectedResult)
	}
	
	public func testLoginHereTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.loginTitle.localized()
		
		XCTAssertEqual(viewModel.loginHereTitle, expectedResult)
	}
	
	public func testNameTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.name.localized()
		
		XCTAssertEqual(viewModel.name, expectedResult)
	}
	
	public func testSurenameTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.surname.localized()
		
		XCTAssertEqual(viewModel.surname, expectedResult)
	}
	
	public func testPersonalCodeTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.personalCode.localized()
		
		XCTAssertEqual(viewModel.personalCode, expectedResult)
	}
	
	public func testDocumentNumberTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.documentNumber.localized()
		
		XCTAssertEqual(viewModel.documentNumber, expectedResult)
	}
	
	public func testSuccessfulRegistrationTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.successfulRegistrationTitle.localized()
		
		XCTAssertEqual(viewModel.successfulRegistration, expectedResult)
	}
	
	public func testSuccessfulRegistrationSubtitleTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.successfulRegistrationSubtitle.localized()
		
		XCTAssertEqual(viewModel.successfulRegistrationSubtitle, expectedResult)
	}
	
	public func testLoginTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.loginSmall.localized()
		
		XCTAssertEqual(viewModel.login, expectedResult)
	}
	
	public func testUnsuccessfulRegistrationTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulRegistrationTitle.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulRegistration, expectedResult)
	}
	
	public func testUnssucessfulRegistrationSubitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.unsuccessfulRegistrationSubtitle.localized()
		
		XCTAssertEqual(viewModel.unsuccessfulRegistrationMessage, expectedResult)
	}
	
	public func testTryAgainTitle() {
		let viewModel = RegistrationViewModel()
		let expectedResult = LocalizationKeys.tryAgain.localized()
		
		XCTAssertEqual(viewModel.tryAgain, expectedResult)
	}
	
	public func testFieldsValidationWhenAllFieldsAreCorrect() {
		let viewModel = RegistrationViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "password"
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField, repeatPasswordField: repeatPasswordField)
		
		XCTAssertTrue(result)
	}
	
	public func testFieldsValidationWhenEmailFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let emailField = UITextField()
		emailField.text = "email"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "password"
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField, repeatPasswordField: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testFieldsValidationWhenPasswordFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let passwordField = UITextField()
		passwordField.text = "pas"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "pas"
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField, repeatPasswordField: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testFieldsValidationWhenRepeatPasswordFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let emailField = UITextField()
		emailField.text = "email@email.com"
		let passwordField = UITextField()
		passwordField.text = "password"
		let repeatPasswordField = UITextField()
		repeatPasswordField.text = "passwrd"
		let result = viewModel.checkForAllValidFields(emailField: emailField, passwordField: passwordField, repeatPasswordField: repeatPasswordField)
		
		XCTAssertFalse(result)
	}
	
	public func testPersonalDataFieldsValidationWhenNameFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let nameField = UITextField()
		nameField.text = ""
		let surnameField = UITextField()
		surnameField.text = "Surnamee"
		let personalCodeField = UITextField()
		personalCodeField.text = "11111111111"
		let documentNumberCodeField = UITextField()
		documentNumberCodeField.text = "222222222222222"
		let result = viewModel.checkPersonalDataValidFields(name: nameField, surname: surnameField, personalCode: personalCodeField, documentNumber: documentNumberCodeField)
		
		XCTAssertFalse(result)
	}
	
	public func testPersonalDataFieldsValidationWhenSurnameFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let nameField = UITextField()
		nameField.text = "Name"
		let surnameField = UITextField()
		surnameField.text = "Surn"
		let personalCodeField = UITextField()
		personalCodeField.text = "11111111111"
		let documentNumberCodeField = UITextField()
		documentNumberCodeField.text = "222222222222222"
		let result = viewModel.checkPersonalDataValidFields(name: nameField, surname: surnameField, personalCode: personalCodeField, documentNumber: documentNumberCodeField)
		
		XCTAssertFalse(result)
	}
	
	public func testPersonalDataFieldsValidationWhenPersonalCodeFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let nameField = UITextField()
		nameField.text = "Name"
		let surnameField = UITextField()
		surnameField.text = "Surnamee"
		let personalCodeField = UITextField()
		personalCodeField.text = "11111111"
		let documentNumberCodeField = UITextField()
		documentNumberCodeField.text = "222222222222222"
		let result = viewModel.checkPersonalDataValidFields(name: nameField, surname: surnameField, personalCode: personalCodeField, documentNumber: documentNumberCodeField)
		
		XCTAssertFalse(result)
	}
	
	public func testPersonalDataFieldsValidationWhenDocumentNumberFieldIsIncorrect() {
		let viewModel = RegistrationViewModel()
		let nameField = UITextField()
		nameField.text = "Name"
		let surnameField = UITextField()
		surnameField.text = "Surnamee"
		let personalCodeField = UITextField()
		personalCodeField.text = "11111111111"
		let documentNumberCodeField = UITextField()
		documentNumberCodeField.text = "2222222"
		let result = viewModel.checkPersonalDataValidFields(name: nameField, surname: surnameField, personalCode: personalCodeField, documentNumber: documentNumberCodeField)
		
		XCTAssertFalse(result)
	}
	
	public func testPersonalDataFieldsValidationWhenAllFieldAreCorrect() {
		let viewModel = RegistrationViewModel()
		let nameField = UITextField()
		nameField.text = "Name"
		let surnameField = UITextField()
		surnameField.text = "Surnamee"
		let personalCodeField = UITextField()
		personalCodeField.text = "11111111111"
		let documentNumberCodeField = UITextField()
		documentNumberCodeField.text = "222222222222222"
		let result = viewModel.checkPersonalDataValidFields(name: nameField, surname: surnameField, personalCode: personalCodeField, documentNumber: documentNumberCodeField)
		
		XCTAssertTrue(result)
	}
	
	public func testRegisterToServiceWhenOneFieldIsMissing() {
		let viewModel = RegistrationViewModel()
		let nameField = "Name"
		let surnameField = "Surnamee"
		let personalCodeField = "11111111111"
		let documentNumberCodeField = "222222222222222"
		let emailField = "email@email.com"
		let expectation = self.expectation(description: "completion block")
		
		viewModel.registerToService(emailText: emailField, passwordText: nil, nameText: nameField, surnameText: surnameField, personalCodeText: personalCodeField, documentNumberText: documentNumberCodeField, completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testRegisterToServiceWhenResponseIsFalse() {
		let serviceMock = LoginServiceMock(registerResponse: false)
		let viewModel = RegistrationViewModel(service: serviceMock)
		let nameField = "Name"
		let surnameField = "Surnamee"
		let personalCodeField = "11111111111"
		let documentNumberCodeField = "222222222222222"
		let emailField = "email@email.com"
		let passwordField = "password"
		let expectation = self.expectation(description: "completion block")
		
		viewModel.registerToService(emailText: emailField, passwordText: passwordField, nameText: nameField, surnameText: surnameField, personalCodeText: personalCodeField, documentNumberText: documentNumberCodeField, completion: {
			result in expectation.fulfill()
			XCTAssertFalse(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
	
	public func testRegisterToServiceWhenResponseIsTrue() {
		let serviceMock = LoginServiceMock(registerResponse: true)
		let viewModel = RegistrationViewModel(service: serviceMock)
		let nameField = "Name"
		let surnameField = "Surnamee"
		let personalCodeField = "11111111111"
		let documentNumberCodeField = "222222222222222"
		let emailField = "email@email.com"
		let passwordField = "password"
		let expectation = self.expectation(description: "completion block")
		
		viewModel.registerToService(emailText: emailField, passwordText: passwordField, nameText: nameField, surnameText: surnameField, personalCodeText: personalCodeField, documentNumberText: documentNumberCodeField, completion: {
			result in expectation.fulfill()
			XCTAssertTrue(result)
		})
		
		self.waitForExpectations(timeout: 1.0, handler: nil)
	}
}

private class LoginServiceMock: LoginService {
	private let registerResponse: Bool
	
	init(registerResponse: Bool) {
		self.registerResponse = registerResponse
	}
	
	override func register(data: Data, completion: @escaping (Bool) -> Void) {
		completion(self.registerResponse)
	}
}
