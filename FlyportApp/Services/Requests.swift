//
//  Requests.swift
//  Servers
//
//  Created by Dovydas Kiriliauskas on 2020-08-11.
//  Copyright © 2020 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct Requests {
	private let type: MethodType
	private let headerFieldName: HeaderField
	private let headerFieldValueName: HeaderFieldValue
	private let bearerToken: String?
	private let url: URL
	private let data: Data?
	
	init(type: MethodType, header: HeaderField, headerValue: HeaderFieldValue, url: URL, bearerToken: String? = nil, data: Data? = nil) {
		self.type = type
		self.headerFieldName = header
		self.headerFieldValueName = headerValue
		self.url = url
		self.bearerToken = bearerToken
		self.data = data
	}
		
	public var getRequestWithData: URLRequest {
		var request = URLRequest(url: self.url)
		request.httpMethod = self.type.methodType
		request.httpBody = self.data
		request.addValue(self.headerFieldValueName.headerField, forHTTPHeaderField: self.headerFieldName.headerField)
		return request
	}
	
	public var getRequest: URLRequest {
		var request = URLRequest(url: self.url)
		request.httpMethod = self.type.methodType
		request.addValue(self.headerFieldValueName.headerField, forHTTPHeaderField: self.headerFieldName.headerField)
		return request
	}
	
	public enum MethodType {
		case get
		case post
		case put
		
		public var methodType: String {
			switch self {
			case .get:
				return "GET"
			case .post:
				return "POST"
			case .put:
				return "PUT"
			}
		}
	}
	
	public enum HeaderField {
		case contentType
		case authorization
		
		public var headerField: String {
			switch self {
			case .contentType:
				return "Content-type"
			case .authorization:
				return "Authorization"
			}
		}
	}
	
	public enum HeaderFieldValue {
		case textJson
		case applicationJson
		
		public var headerField: String {
			switch self {
			case .textJson:
				return "text/json"
			case .applicationJson:
				return "application/json"
			}
		}
	}
}
