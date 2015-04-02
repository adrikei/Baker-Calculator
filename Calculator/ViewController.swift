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
	@IBOutlet weak var subDisplay: UILabel!
	
	var userIsInTheMiddleOfTypingANumber = false
	var firstValue: Double!
	var op: String! = ""
	
	var displayValue: Double {
		get{
			return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
		}
		set{
			display.text = "\(newValue)"
		}
	}
	@IBAction func clearCalculator(sender: UIButton) {
		op = ""
		display.text = "0"
		firstValue = nil
		subDisplay.text = " "
		userIsInTheMiddleOfTypingANumber = false
	}
	
	@IBAction func appendDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if digit != "." || display.text!.rangeOfString(".") == nil{
			if userIsInTheMiddleOfTypingANumber {
				display.text = display.text! + digit
			}else{
				display.text = digit
				userIsInTheMiddleOfTypingANumber = true
			}
			subDisplay.text = subDisplay.text! + digit
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
		self.firstValue = displayValue;
		op  = ""
		subDisplay.text = " "
	}
	
	func resetDisplay() {
		display.text = "0"
		userIsInTheMiddleOfTypingANumber = false
	}
	
	@IBAction func operate(sender: UIButton) {
		firstValue = displayValue
		op = sender.currentTitle!
		if subDisplay.text == " "{
			subDisplay.text = "\(displayValue)" + op
		}else{
			subDisplay.text = subDisplay.text! + op
		}
		resetDisplay()
	}
	
}

