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
    
    public func searchFlightURL() -> URL {
        let url = URL(string: self.keywords.searchFlights)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func registerUserFlightURL() -> URL {
        let url = URL(string: self.keywords.registerUserFlight)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func completeFlightURL(userFlightId: Int) -> URL {
        let updatedUrl = self.keywords.flightPoints + String(userFlightId) + self.keywords.completeUserFlightEnding
        let url = URL(string: updatedUrl)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func boardingGatesURL(userFlightId: Int) -> URL {
        let updatedUrl = self.keywords.completeUserFlight + String(userFlightId) + self.keywords.boardingGates
        let url = URL(string: updatedUrl)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func passportPointURL(userFlightId: Int) -> URL {
        let updatedUrl = self.keywords.completeUserFlight + String(userFlightId) + self.keywords.passportPoint
        let url = URL(string: updatedUrl)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func registrationPointURL(userFlightId: Int) -> URL {
        let updatedUrl = self.keywords.completeUserFlight + String(userFlightId) + self.keywords.registrationPoint
        let url = URL(string: updatedUrl)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
    
    public func securityPointURL(userFlightId: Int) -> URL {
        let updatedUrl = self.keywords.completeUserFlight + String(userFlightId) + self.keywords.securityPoint
        let url = URL(string: updatedUrl)
        
        guard let requestUrl = url else { fatalError() }
        return requestUrl
    }
}
