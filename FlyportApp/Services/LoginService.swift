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
			var request = requestHeader.loginRequest
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
						catch let error { print(error.localizedDescription) }
					}
				}
			}
			task.resume()
			return
		}
	
//		public func getServers(token: String, completion: @escaping ([Server]?) -> Void) {
//			var result: [Server]?
//			let url = self.requestURL.getServersList()
//
//			let requestHeader = Requests(type: .get, header: .contentType, headerValue: .applicationJson, url: url, bearerToken: token)
//			let request = requestHeader.serversRequest
//
//			let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//				DispatchQueue.main.async {
//					if let error = error {
//						print("Error took place \(error)")
//						completion(nil)
//					}
//					if let data = data {
//						do {
//							result = try JSONDecoder().decode([Server].self, from: data)
//							completion(result)
//						}
//						catch let error { print(error.localizedDescription) }
//					}
//				}
//			}
//			task.resume()
//			return
//		}
}
