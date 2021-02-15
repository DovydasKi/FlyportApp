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
		let request = requestHeader.userFlightsRequest
		
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
}