//
//  LoadingContent.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-04-12.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension NVActivityIndicatorView {
	var loadingIndicator: NVActivityIndicatorView {
		let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 150, height: 150), type: .circleStrokeSpin, color: UIColor(named: "ButtonColor"))
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
	}
}

extension UIView {
	var loadingView: UIView {
		let loadingView = UIView()
		loadingView.translatesAutoresizingMaskIntoConstraints = false
		loadingView.backgroundColor = .gray
		loadingView.alpha = 0.5
		return loadingView
	}
}
