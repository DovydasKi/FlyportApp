//
//  LoginService.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-03.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation


public class LoginService {
		private let requestURL: RequestURL = RequestURL()
		
		public init() {}
		
		public func login(data: Data, completion: @escaping (LoginResponse?) -> Void) {
			var result: LoginResponse?
			let url = self.requestURL.loginUrl()
	
			let requestHeader = Requests(type: .post, header: .contentType, headerValue: .applicationJson, url: url)
			var request = requestHeader.getRequestWithData
			request.httpBody = data
	
			let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
				DispatchQueue.main.async {
					if let error = error {
						print("Error took place \(error)")
						completion(nil)
					}
					if let data = data {
						do {
							result = try JSONDecoder().decode(LoginResponse.self, from: data)
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
	
		public func register(data: Data, completion: @escaping (Bool) -> Void) {
			let url = self.requestURL.registerURL()
	
			let requestHeader = Requests(type: .post, header: .contentType, headerValue: .applicationJson, url: url)
			var request = requestHeader.getRequestWithData
			request.httpBody = data
	
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
	
		public func getProfileData(completion: @escaping (UserProfileModel?) -> Void) {
			var result: UserProfileModel?
			let url = self.requestURL.profileInfoURL()
	
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
							result = try JSONDecoder().decode(UserProfileModel.self, from: data)
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
	
		public func updateProfile(data: Data, completion: @escaping (Bool) -> Void) {
			let url = self.requestURL.updateProfileURL()
	
			let requestHeader = Requests(type: .put, header: .contentType, headerValue: .applicationJson, url: url)
			var request = requestHeader.getRequestWithData
			request.httpBody = data
	
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
