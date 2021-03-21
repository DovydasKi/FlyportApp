//
//  AirlinesEnumTests.swift
//  FlyportAppTests
//
//  Created by Dovydas Kiriliauskas on 2021-03-21.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import XCTest
@testable import FlyportApp

class AirlinesEnumTests: XCTestCase {
	public func testGetWizzAirlinesImage() {
		let airlinesEnum = Airlines(airlinesName: "Wizzair")
		let image = airlinesEnum.getAirlinesImage()
		
		XCTAssertEqual(image, UIImage(named: "wizzair"))
	}
	
	public func testGetGetjetAirlinesImage() {
		let airlinesEnum = Airlines(airlinesName: "GetJet airlines")
		let image = airlinesEnum.getAirlinesImage()
		
		XCTAssertEqual(image, UIImage(named: "getjet"))
	}
	
	public func testGetRyanairAirlinesImage() {
		let airlinesEnum = Airlines(airlinesName: "Ryanair")
		let image = airlinesEnum.getAirlinesImage()
		
		XCTAssertEqual(image, UIImage(named: "ryanair"))
	}
}
