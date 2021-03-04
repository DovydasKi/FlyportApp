//
//  ImageExtension.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-03-04.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	public func image(_ originalImage:UIImage, scaledToSize:CGSize) -> UIImage {
		if originalImage.size.equalTo(scaledToSize) {
			return originalImage
		}
		UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
		originalImage.draw(in: CGRect(x: 0, y: 0, width: scaledToSize.width, height: scaledToSize.height))
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image!
	}
}
