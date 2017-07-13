//
//  Extensions.swift
//  Calendar
//
//  Created by Delyar on 4/22/1396 AP.
//  Copyright © 1396 NojanOnline. All rights reserved.
//

import Foundation

extension Date {
	func isGreaterThanDate(_ dateToCompare: Date) -> Bool {
		return compare(dateToCompare) == .orderedDescending
	}
	
	func isLessThanDate(_ dateToCompare: Date) -> Bool {
		return compare(dateToCompare) == .orderedAscending
	}
	
	func equalToDate(_ dateToCompare: Date) -> Bool {
		return compare(dateToCompare) == .orderedSame
	}
	
	func isWithinInclusiveBoundaryDates(_ startDate: Date, endDate: Date) -> Bool {
		return (equalToDate(startDate) || isGreaterThanDate(startDate)) && (equalToDate(endDate) || isLessThanDate(endDate))
	}
	
	func isWithinExclusiveBoundaryDates(_ startDate: Date, endDate: Date) -> Bool {
		return isGreaterThanDate(startDate) && isLessThanDate(endDate)
	}
	
	func isToday(inCalendar calendar: Calendar) -> Bool {
		let comps = calendar.dateComponents([.era, .year, .month, .weekday, .day], from: self)
		let nowComps = calendar.dateComponents([.era, .year, .month, .weekday, .day], from: Date())
		guard let now = calendar.date(from: nowComps) else { return false }
		return calendar.date(from: comps)?.equalToDate(now) ?? false
	}
	
	
	/// Returns the amount of years from another date
	func years(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.year], from: date, to: self).year ?? 0
	}
	/// Returns the amount of months from another date
	func months(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.month], from: date, to: self).month ?? 0
	}
	/// Returns the amount of weeks from another date
	func weeks(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
	}
	/// Returns the amount of days from another date
	func days(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.day], from: date, to: self).day ?? 0
	}
	/// Returns the amount of hours from another date
	func hours(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.hour], from: date, to: self).hour ?? 0
	}
	/// Returns the amount of minutes from another date
	func minutes(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.minute], from: date, to: self).minute ?? 0
	}
	/// Returns the amount of seconds from another date
	func seconds(from date: Date) -> Int {
		return FormatManager.persianCalendar.dateComponents([.second], from: date, to: self).second ?? 0
	}
	/// Returns the a custom time interval description from another date
	func offset(from date: Date) -> String {
		//		if years(from: date)   > 0 { return "\(years(from: date))y"   }
		//		if months(from: date)  > 0 { return "\(months(from: date))M"  }
		//		if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
		//		if days(from: date)    > 0 { return "\(days(from: date))d"    }
		//		if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
		//		if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
		//		if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
		//
		//		return ""
		
		return "\(hours(from: date))h - \(minutes(from: date))m - \(seconds(from: date))s"
	}
	
}
