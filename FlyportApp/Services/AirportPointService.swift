//
//  AirportPointService.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class AirportPointService {
	private let requestURL: RequestURL = RequestURL()
	
	public init() {}
	
	public func getBoardingGates(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		let url = self.requestURL.boardingGatesURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .get, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(false)
				}
				if let responseBody = response as? HTTPURLResponse{
					if responseBody.statusCode == 200 {
						completion(true)
					} else {
						completion(false)
					}
				} else {completion(false)}
			}
		}
		task.resume()
		return
	}
	
	public func getPassportPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		var result: AirportPointModel?
		let url = self.requestURL.passportPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .get, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(nil)
				}
				if let data = data {
					do {
						result = try JSONDecoder().decode(AirportPointModel.self, from: data)
						completion(result)
					}
					catch let error { print(error.localizedDescription)
						completion(nil)
					}
				}
			}
		}
		task.resume()
		return
	}
	
	public func completePassportPointVisit(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		let url = self.requestURL.passportPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .put, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(false)
				}
				if let responseBody = response as? HTTPURLResponse{
					if responseBody.statusCode == 200 {
						completion(true)
					} else {
						completion(false)
					}
				} else {completion(false)}
			}
		}
		task.resume()
		return
	}
	
	public func getRegistrationPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		var result: AirportPointModel?
		let url = self.requestURL.registrationPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .get, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(nil)
				}
				if let data = data {
					do {
						result = try JSONDecoder().decode(AirportPointModel.self, from: data)
						completion(result)
					}
					catch let error { print(error.localizedDescription)
						completion(nil)
					}
				}
			}
		}
		task.resume()
		return
	}
	
	public func completeRegistrationPointVisit(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		let url = self.requestURL.registrationPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .put, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(false)
				}
				if let responseBody = response as? HTTPURLResponse{
					if responseBody.statusCode == 200 {
						completion(true)
					} else {
						completion(false)
					}
				} else {completion(false)}
			}
		}
		task.resume()
		return
	}
	
	public func getSecurityPoint(userFlightId: Int, completion: @escaping (AirportPointModel?) -> Void) {
		var result: AirportPointModel?
		let url = self.requestURL.securityPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .get, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(nil)
				}
				if let data = data {
					do {
						result = try JSONDecoder().decode(AirportPointModel.self, from: data)
						completion(result)
					}
					catch let error { print(error.localizedDescription)
						completion(nil)
					}
				}
			}
		}
		task.resume()
		return
	}
	
	public func completeSecurityPointVisit(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		let url = self.requestURL.securityPointURL(userFlightId: userFlightId)
		
		let requestHeader = Requests(type: .put, header: .contentType, headerValue: .applicationJson, url: url)
		let request = requestHeader.getRequest
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(false)
				}
				if let responseBody = response as? HTTPURLResponse{
					if responseBody.statusCode == 200 {
						completion(true)
					} else {
						completion(false)
					}
				} else {completion(false)}
			}
		}
		task.resume()
		return
	}
}
