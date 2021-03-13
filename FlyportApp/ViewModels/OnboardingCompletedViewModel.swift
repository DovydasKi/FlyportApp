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
	private static let congratsTitle: String = LocalizationKeys.congrats.localized()
	private static let congratsSubtitle: String = LocalizationKeys.readyForFlight.localized()
	private static let errorTitle: String = LocalizationKeys.error.localized()
	private static let errorSubtitle: String = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	
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
