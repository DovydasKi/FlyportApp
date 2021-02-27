//
//  OnboardingCompletedViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class OnboardingCompletedViewModel {
	private let userFlightsService = UserFlightsService()
	private static let congratsTitle: String = "COOONGRATS!"
	private static let congratsSubtitle: String = "YOU'RE READY FOR YOUR FLIGHT!"
	private static let errorTitle: String = "Error"
	private static let errorSubtitle: String = "Something went wrong. Try again"
	private static let ok: String = "Ok"
	
	public func completeFlight(completion: @escaping (Bool) -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		
		self.userFlightsService.completeUserFlight(userFlightId: userFlightId, completion: {
			completed in
			if completed {
				completion(true)
			} else {
				completion(false)
			}
		})
	}
}

extension OnboardingCompletedViewModel {
	public var congratsTitle: String {
		return type(of: self).congratsTitle
	}
	
	public var congratsSubtitle: String {
		return type(of: self).congratsSubtitle
	}
	
	public var errorTitle: String {
		return type(of: self).errorTitle
	}
	
	public var errorSubtitle: String {
		return type(of: self).errorSubtitle
	}
	
	public var ok: String {
		return type(of: self).ok
	}
}
