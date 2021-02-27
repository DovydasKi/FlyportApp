//
//  InputValidation.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-04.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class InputValidation {
    public func checkForValidEmailRegularExpression(input: UITextField) -> Bool {
        guard let isValid = input.text?.isValidEmail else {
            return false
        }
        return isValid
    }

    public func checkForValidStringRegularExpression(input: UITextField, regularExpression: String) -> Bool {
        guard let text = input.text else { return true }

        if text.range(of: regularExpression, options: .regularExpression) != nil {
            return false
        }
        else {
            return true
        }
    }

    public func checkForValidStringLenght(input: UITextField, lenght: Int) -> Bool {
        guard let text = input.text else { return true }
        
        if text.count < lenght {
            return false
        }
        return true
    }
	
    public func checkForValidStringLenghtIsNotSmaller(input: UITextField, lenght: Int) -> Bool {
        guard let text = input.text else { return false }
        
        if text.count >= lenght {
            return true
        }
        return false
    }
	
    public func checkForValidDate(input: UITextField) -> Bool {
        guard let text = input.text else { return false }
		let seperateDate = text.split(separator: "-")
		let todaysDate = Date()
        let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.string(from: todaysDate)
		let todaysDateSeperate = date.split(separator: "-")
		
		if Int(seperateDate[0])! > Int(todaysDateSeperate[0])! {
			return true
		} else if Int(seperateDate[0])! == Int(todaysDateSeperate[0])! {
			if Int(seperateDate[1])! > Int(todaysDateSeperate[1])! {
				return true
			} else if Int(seperateDate[1])! == Int(todaysDateSeperate[1])! {
				if Int(seperateDate[2])! >= Int(todaysDateSeperate[2])! {
					return true
				} else {
					return false
				}
			} else {
				return false
			}
		}
		else {
			return false
		}
    }

    public func shakeIfInvalid(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
}
