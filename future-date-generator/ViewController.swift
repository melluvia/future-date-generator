//
//  ViewController.swift
//  future-date-generator
//
//  Created by Melissa Phillips on 11/13/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var monthTextField: UITextField!
	@IBOutlet var dayTextField: UITextField!
	@IBOutlet var yearTextField: UITextField!
	@IBOutlet var addSecondsTextField: UITextField!
	@IBOutlet var dateLabel: UILabel!
	
	
	@IBAction func calculateDateButton(_ sender: Any) {
		
		// Check if values exist
		
		if monthTextField.text != "" && dayTextField.text != "" && yearTextField.text != "" {
			
			//Check if value entered for Month is valid
			
			switch Int(monthTextField.text!)! {
				
				case 1...12:
				
				//Check if value entered for Day is valid
				
					switch Int(dayTextField.text!)! {
					
				case 1...31:
					
						//Check if value entered for Year is valid
						
					switch Int(yearTextField.text!)! {
						
				case 1000..<9999:
						
					// Create Date string variable
							
					let dateString: String = "\(yearTextField.text!) - \(monthTextField.text!) - \(dayTextField.text!) 12:00:00 AM"
							
					let formatter:DateFormatter = DateFormatter()
					formatter.amSymbol = "AM"
					formatter.pmSymbol = "PM"
					formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a"
						
					// Add seconds to Date
							
					if addSecondsTextField.text == "" {
							
					print("Seconds Empty")
					dateLabel.text = formatter.string(from: formatter.date(from: dateString)!)
					print(formatter.string(from: formatter.date(from: dateString)!))
							
						} else {
							
							print("Seconds not Empty")
							// convert seconds to minutes
							let secToAdd: Double = Double(addSecondsTextField.text!)! * 60
							// Add specified time amount to given date
							let newDate:Date = Date.init(timeInterval: secToAdd, since: formatter.date(from: dateString)!)
							dateLabel.text = formatter.string(from: newDate)
						}
						
					default:
						dateLabel.text = "Incorrect Year"
						return
					}
				default:
					dateLabel.text = "Incorrect Day"
					return
				}
			default:
				dateLabel.text = "Incorrect Month"
				return
			}
			
		} else {
			dateLabel.text = "Missing Date Components"
		}
		
	}
	
	@IBAction func resetButton(_ sender: Any) {
		resetDate()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		resetDate()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}
	
	
	func resetDate() -> (Void) {
		dateLabel.text = ""
		monthTextField.text = ""
		dayTextField.text = ""
		yearTextField.text = ""
		addSecondsTextField.text = ""
	}
	
}


