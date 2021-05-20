//
//  ServiceKeyboards.swift
//  Servers
//
//  Created by Dovydas Kiriliauskas on 2020-08-11.
//  Copyright © 2020 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct ServiceKeywords {
	private static let userFlights = "https://flyportbackend.azurewebsites.net/flights/"
	private static let login = "https://flyportbackend.azurewebsites.net/login"
	private static let register = "https://flyportbackend.azurewebsites.net/registration"
	private static let profileInfo = "https://flyportbackend.azurewebsites.net/profile/"
	private static let flightPoints = "https://flyportbackend.azurewebsites.net/flights/airportPoints/"
	private static let updateProfile = "https://flyportbackend.azurewebsites.net/profile/"
    private static let searchFlights = "https://flyportbackend.azurewebsites.net/flights/search"
    private static let registerUserFlight = "https://flyportbackend.azurewebsites.net/user/flight"
    private static let completeUserFlight = "https://flyportbackend.azurewebsites.net/flight/"
    private static let completeUserFlightEnding = "/complete"
    private static let boardingGates = "/point/boarding"
    private static let passportPoint = "/point/passport"
    private static let registrationPoint = "/point/registration"
    private static let securityPoint = "/point/security"
    
	public init() { }
}

extension ServiceKeywords {
	public var userFlights: String { type(of: self).userFlights }
	public var login: String { type(of: self).login }
	public var register: String { type(of: self).register }
	public var profileInfo: String { type(of: self).profileInfo }
	public var flightPoints: String { type(of: self).flightPoints }
	public var updateProfile: String { type(of: self).updateProfile}
    public var searchFlights: String { type(of: self).searchFlights}
    public var registerUserFlight: String { type(of: self).registerUserFlight}
    public var completeUserFlight: String { type(of: self).completeUserFlight}
    public var completeUserFlightEnding: String { type(of: self).completeUserFlightEnding}
    public var boardingGates: String { type(of: self).boardingGates}
    public var passportPoint: String { type(of: self).passportPoint}
    public var registrationPoint: String { type(of: self).registrationPoint}
    public var securityPoint: String { type(of: self).securityPoint}
}
