//
//  SplashScreenViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-01.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class SplashScreenViewModel {
	private static let flyportLabelTitle = LocalizationKeys.flyPortTitle.localized()
	private static let flyportSubtitleText = LocalizationKeys.flyPortSubtitle.localized()
}

extension SplashScreenViewModel {
    public var flyportLabelTitle: String {
        type(of: self).flyportLabelTitle
    }
	
	public var flyportSubtitleText: String {
		type(of: self).flyportSubtitleText
	}
}
