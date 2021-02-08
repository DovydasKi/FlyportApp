//
//  TabBarViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class TabBarViewModel {
    private static let profileTitle = "Profile"
    private static let myFlightsTitle = "My flights"
    private static let settingsTitle = "Settings"
}

extension TabBarViewModel {
    public var profileTitle: String {
        type(of: self).profileTitle
    }
    
    public var myFlightsTitle: String {
        type(of: self).myFlightsTitle
    }
    
    public var settingsTitle: String {
        type(of: self).settingsTitle
    }
}
