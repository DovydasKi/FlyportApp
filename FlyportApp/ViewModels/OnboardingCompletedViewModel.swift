//
//  OnboardingCompletedViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class OnboardingCompletedViewModel {
	private static let congratsTitle: String = "COOONGRATS!"
	private static let congratsSubtitle: String = "YOU'RE READY FOR YOUR FLIGHT!"
}

extension OnboardingCompletedViewModel {
	public var congratsTitle: String {
		return type(of: self).congratsTitle
	}
	
	public var congratsSubtitle: String {
		return type(of: self).congratsSubtitle
	}
}
