//
//  AirlinesEnum.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-10.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public struct Airlines {
	public let airlinesName: String
	
	public init(airlinesName: String) {
		self.airlinesName = airlinesName
	}
	
	public func getAirlinesImage() -> UIImage {
		let airlinesType = self.getAirlinesEnumType(airline: self.airlinesName)
		return airlinesType.airlinesImage
	}
	
	private func getAirlinesEnumType(airline: String) -> AirlinesEnum {
		switch airline {
		case "GetJet airlines":
			return AirlinesEnum.getjet
		case "Wizzair":
			return AirlinesEnum.wizzair
		default:
			return AirlinesEnum.ryanair
		}
	}
	
public enum AirlinesEnum {
	case getjet
	case wizzair
	case ryanair
	
	public var airlinesImage: UIImage {
		switch self {
		case .getjet:
			return UIImage(named: "getjet")!
		case .wizzair:
			return UIImage(named: "wizzair")!
		case .ryanair:
			return UIImage(named: "ryanair")!
		}
	}
}
}
