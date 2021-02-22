//
//  RequestURL.swift
//  Servers
//
//  Created by Dovydas Kiriliauskas on 2020-08-11.
//  Copyright © 2020 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct RequestURL {
	private let keywords: ServiceKeywords
	
	public init(keywords: ServiceKeywords = ServiceKeywords()) {
		self.keywords = keywords
	}
	
	public func loginUrl() -> URL {
		let url = URL(string: self.keywords.login)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
	
	public func registerURL() -> URL {
		let url = URL(string: self.keywords.register)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
	
	public func profileInfoURL() -> URL {
		let updatedUrl = self.keywords.profileInfo + String(UserDefaults.standard.getUserId())
		let url = URL(string: updatedUrl)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
	
	public func userFlightsURL() -> URL {
		let updatedUrl = self.keywords.userFlights + String(UserDefaults.standard.getUserId())
		let url = URL(string: updatedUrl)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
	
	public func flightPointsURL(flightId: Int) -> URL {
		let updatedUrl = self.keywords.flightPoints + String(flightId)
		let url = URL(string: updatedUrl)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
	
	public func updateProfileURL() -> URL {
		let updatedUrl = self.keywords.updateProfile + String(UserDefaults.standard.getUserId())
		let url = URL(string: updatedUrl)
		
		guard let requestUrl = url else { fatalError() }
		return requestUrl
	}
}
