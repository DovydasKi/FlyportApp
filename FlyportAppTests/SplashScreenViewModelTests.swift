//
//  SplashScreenViewModelTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-19.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class SplashScreenViewModelTests: XCTestCase {
	
	public func testFlyportLabelTitle() {
		let viewModel = SplashScreenViewModel()
		let expectedResult = LocalizationKeys.flyPortTitle.localized()
		
		XCTAssertEqual(viewModel.flyportLabelTitle, expectedResult)
	}
	
	public func testFlyportSubtitleText() {
		let viewModel = SplashScreenViewModel()
		let expectedResult = LocalizationKeys.flyPortSubtitle.localized()
		
		XCTAssertEqual(viewModel.flyportSubtitleText, expectedResult)
	}
}
