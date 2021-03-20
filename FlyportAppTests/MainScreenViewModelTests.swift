//
//  MainScreenViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-19.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class MainScreenViewModelTests: XCTestCase {
	
	public func testFlyportLabelTitle() {
		let viewModel = MainScreenViewModel()
		let expectedResult = LocalizationKeys.flyPortTitle.localized()
		
		XCTAssertEqual(viewModel.flyportLabelTitle, expectedResult)
	}
	
	public func testFlyportSubtitleText() {
		let viewModel = MainScreenViewModel()
		let expectedResult = LocalizationKeys.flyPortSubtitle.localized()
		
		XCTAssertEqual(viewModel.flyportSubtitleText, expectedResult)
	}
	
	public func testLoginTitle() {
		let viewModel = MainScreenViewModel()
		let expectedResult = LocalizationKeys.login.localized()
		
		XCTAssertEqual(viewModel.loginTitle, expectedResult)
	}
	
	public func testRegisterTitle() {
		let viewModel = MainScreenViewModel()
		let expectedResult = LocalizationKeys.register.localized()
		
		XCTAssertEqual(viewModel.registerTitle, expectedResult)
	}
}
