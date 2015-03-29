//
//  ViewController.swift
//  Calculator
//
//  Created by Adriano Pais Rodrigues on 3/29/15.
//  Copyright (c) 2015 Adriano Pais Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var display: UILabel!

	var userIsInTheMiddleOfTypingANumber = false
	var firstValue: Double!
	var op: String!
	
	var displayValue: Double {
		get{
			return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
		}
		set{
			display.text = "\(newValue)"
		}
	}
	
	@IBAction func appendDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTypingANumber {
			display.text = display.text! + digit
		}else{
			display.text = digit
			userIsInTheMiddleOfTypingANumber = true
		}
	}
	
	@IBAction func equals() {
		userIsInTheMiddleOfTypingANumber = false
		var secondValue = displayValue
		switch op {
			case "÷": displayValue = self.firstValue / secondValue
			case "×": displayValue = self.firstValue * secondValue
			case "−": displayValue = self.firstValue - secondValue
			case "+": displayValue = self.firstValue + secondValue
			default: break
		}
	}
	
	func resetDisplay() {
		display.text = "0"
		userIsInTheMiddleOfTypingANumber = false
	}
	
	@IBAction func operate(sender: UIButton) {
		firstValue = displayValue
		resetDisplay()
		op = sender.currentTitle!
	}
	
}

