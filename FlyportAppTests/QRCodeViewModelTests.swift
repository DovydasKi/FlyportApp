//
//  QRCodeViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class QRCodeViewModelTests: XCTestCase {
	
	public func testYourCodeTitle() {
		let viewModel = QRCodeViewModel(flightNumber: "1", route: "Vilnius - Riga")
		let expectedResult = LocalizationKeys.yourQR.localized()
		
		XCTAssertEqual(viewModel.yourCodeTitle, expectedResult)
	}
	
	public func testHideCodeTitle() {
		let viewModel = QRCodeViewModel(flightNumber: "1", route: "Vilnius - Riga")
		let expectedResult = LocalizationKeys.hideQR.localized()
		
		XCTAssertEqual(viewModel.hideCodeTitle, expectedResult)
	}
	
	public func testQRDataFormatting() {
		UserDefaults.standard.setPersonalInfo(value: UserPersonalInfoModel(name: "Name", surname: "Surname", personalCode: "1111", documentNumber: "2222"))
		let viewModel = QRCodeViewModel(flightNumber: "1", route: "Vilnius - Riga")
		let result = viewModel.getRegistrationTableQRDate()
		
		XCTAssertNotNil(result)
	}
}
