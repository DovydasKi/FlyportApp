//
//  RegisteredLuggageViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class RegisteredLuggageViewModel {
	private static let luggageQuestion: String = "Do you have registered luggage?"
}

extension RegisteredLuggageViewModel {
	public var luggageQuestion: String {
		return type(of: self).luggageQuestion
	}
}
