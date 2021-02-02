//
//  MainScreenViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class MainScreenViewModel {
	private static let flyportLabelTitle = "FlyPort"
	private static let flyportSubtitleText = "Now airplanes are slower than airPorts..."
	private static let loginTitle = "LOGIN"
	private static let registerTitle = "REGISTER"
}

extension MainScreenViewModel {
	public var flyportLabelTitle: String {
		return type(of: self).flyportLabelTitle
	}
	
	public var flyportSubtitleText: String {
		return type(of: self).flyportSubtitleText
	}
	
	public var loginTitle: String {
		return type(of: self).loginTitle
	}
	
	public var registerTitle: String {
		return type(of: self).registerTitle
	}
}
