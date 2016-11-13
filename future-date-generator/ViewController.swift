//
//  ViewController.swift
//  future-date-generator
//
//  Created by Melissa Phillips on 11/13/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var month: UITextField!
	@IBOutlet var day: UITextField!
	@IBOutlet var year: UITextField!
	@IBOutlet var seconds: UITextField!
	@IBOutlet var dateLabel: UILabel!

	@IBAction func calculate(_ sender: Any) {
		
		// Check if values exist
		
		if month.text != "" && day.text != "" && year.text != "" {
			
			//Check if value entered for Month is valid
			
			switch Int(month.text!)! {
				
				case 1...12:
				
				//Check if value entered for Day is valid
				
					switch Int(day.text!)! {
					
				case 1...31:
					
						//Check if value entered for Year is valid
						
					switch Int(year.text!)! {
						
				case 1000..<9999:
						
					// Create Date string variable
	
					let dateString: String = "\(year.text!) - \(month.text!) - \(day.text!) 12:00:00 AM"
							
					let formatter: DateFormatter = DateFormatter()
					formatter.amSymbol = "AM"
					formatter.pmSymbol = "PM"
					formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a"
						
					// Add seconds to Date
							
					if seconds.text == "" {
							
					print("Seconds Empty")
					dateLabel.text = formatter.string(from: formatter.date(from: dateString)!)
					print(formatter.string(from: formatter.date(from: dateString)!))
							
						} else {
							
							print("Seconds not Empty")
							// convert seconds to minutes
							let AddSeconds: Double = Double(seconds.text!)! * 60
							// Add specified time amount to given date
							let newDate: Date = Date.init(timeInterval: AddSeconds, since: formatter.date(from: dateString)!)
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
		month.text = ""
		day.text = ""
		year.text = ""
		seconds.text = ""
	}
	
}


