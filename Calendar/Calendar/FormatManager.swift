//
//  FormatManager.swift
//  BookFlight
//
//  Created by Delyar Tabatabaei on 7/1/1395 AP.
//  Copyright © 1395 AP Nojan. All rights reserved.
//

import Foundation

class FormatManager {
	
	static func isValidEmail(testStr:String) -> Bool {
		// print("validate calendar: \(testStr)")
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: testStr)
	}
	
	static func isPasswordValid(password: String) -> Bool{
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
		return passwordTest.evaluate(with: password)
	}
	
	static var emailTest: NSPredicate {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
		return NSPredicate(format:"SELF MATCHES %@", emailRegEx)
	}
	
//	static func convertDateToInt(date: Date) -> Int{
//		let day = FormatManager.persianCalendar.component(.day, from: date)
//		let year = FormatManager.persianCalendar.component(.year, from: date)
//		let month = FormatManager.persianCalendar.component(.month, from: date)
//		var zeroMonth = ""
//		var zerodate = ""
//		if month.digitCount < 2 {
//			zeroMonth = "0"
//		}
//		if day.digitCount < 2 {
//			zerodate = "0"
//		}
//		let dateString = String(year) + zeroMonth + String(month) + zerodate + String(day)
//		return Int(dateString)!
//	}
	static func convertIntToDate(int: Int) -> Date {
		var startComps = DateComponents()
		startComps.year = (int - int % 10000) / 10000
		startComps.month = (int % 10000 - int % 100) / 100
		startComps.day = int % 100
		return FormatManager.persianCalendar.date(from: startComps)!
	}
	
	static let persianLocale = Locale(identifier: "fa_IR")
	static let persianCalendar = Calendar(identifier: Calendar.Identifier.persian)
	
	static let englishLocale = Locale(identifier: "en_US")
	static let englishCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
	
	static var numberFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static var ordinalNumberFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.numberStyle = .spellOut
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static var currencyFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.locale = persianLocale as Locale!
		formatter.numberStyle = .decimal
		return formatter
	}
	static let jsonDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
	static var jsonDateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = jsonDateFormat
		return formatter
	}
	
	static let roozFormat = "EEEE"
	static var roozFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = roozFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let yearFormat = "yyyy"
	static var yearFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = yearFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let monthYearFormat = "MMMM yyyy"
	static var monthYearFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = monthYearFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let monthFormat = "MMMM"
	static var monthFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = monthFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let chandshanbeFormat = "EEEE"
	static var chandshanbeFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = chandshanbeFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let dayFormat = "d"
	static var dayFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = dayFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static let mahaneFormat = "MMMM"
	static var mahaneFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = mahaneFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	
	static let dateFormat = "EEEE dd MMMM yyyy"
	static var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = dateFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static let resultDateFormat = "EEEE yy/MM/dd"
	static var resultDateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = resultDateFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static let resultTimeFormat = "HH:mm"
	static var resultTimeFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = persianCalendar as Calendar!
		formatter.dateFormat = resultTimeFormat
		formatter.locale = persianLocale as Locale!
		return formatter
	}
	static let passengerDateFormat = "ddMMMyy"
	static var passengerDateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = englishCalendar as Calendar!
		formatter.dateFormat = passengerDateFormat
		formatter.locale = englishLocale as Locale!
		return formatter
	}
	
	
	
}
