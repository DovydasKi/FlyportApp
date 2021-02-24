//
//  UserFlightsService.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-09.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class UserFlightsService {
	private let requestURL: RequestURL = RequestURL()
	
	public init() {}
	
	public func getUserFlightsData(completion: @escaping (UserFlightsModel?) -> Void) {
		var result: UserFlightsModel?
		let url = self.requestURL.userFlightsURL()
		
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
						result = try JSONDecoder().decode(UserFlightsModel.self, from: data)
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
	
	public func getAirportPointsData(flightId: Int, completion: @escaping (FlightAirportPointsModel?) -> Void) {
		var result: FlightAirportPointsModel?
		let url = self.requestURL.flightPointsURL(flightId: flightId)
		
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
						result = try JSONDecoder().decode(FlightAirportPointsModel.self, from: data)
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
	
	public func flightsSearch(data: Data, completion: @escaping (FlightInfoModel?) -> Void) {
		var result: FlightInfoModel?
		let url = self.requestURL.searchFlightURL()
		
		let requestHeader = Requests(type: .post, header: .contentType, headerValue: .applicationJson, url: url, data: data)
		let request = requestHeader.getRequestWithData
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(nil)
				}
				if let data = data {
					do {
						result = try JSONDecoder().decode(FlightInfoModel.self, from: data)
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
	
	public func registerUserFlight(data: Data, completion: @escaping (UserFlightCreationResponseModel?) -> Void) {
		var result: UserFlightCreationResponseModel?
		let url = self.requestURL.registerUserFlightURL()
		
		let requestHeader = Requests(type: .post, header: .contentType, headerValue: .applicationJson, url: url, data: data)
		let request = requestHeader.getRequestWithData
		
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			DispatchQueue.main.async {
				if let error = error {
					print("Error took place \(error)")
					completion(nil)
				}
				if let data = data {
					do {
						result = try JSONDecoder().decode(UserFlightCreationResponseModel.self, from: data)
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
	
	public func completeUserFlight(userFlightId: Int, completion: @escaping (Bool) -> Void) {
		let url = self.requestURL.completeFlightURL(userFlightId: userFlightId)
		
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
