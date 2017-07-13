//
//  ViewController.swift
//  Calendar
//
//  Created by Delyar on 4/21/1396 AP.
//  Copyright © 1396 NojanOnline. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	@IBOutlet weak var collectionView: UICollectionView!
	
	@IBOutlet weak var topLabel: UILabel!
	var dates = [Date?]()
	
	var date: Date? // first date
	var startComps = DateComponents()
	var startCompsYear = FormatManager.persianCalendar.component(.year, from: Date())
	var startComsMonth = FormatManager.persianCalendar.component(.month, from: Date())
	
	var endDate = Date()
	var endComps = DateComponents()
	var endCompsYear = FormatManager.persianCalendar.component(.year, from: Date())
	var endCompsMonth = FormatManager.persianCalendar.component(.month, from: Date())
	
	
	var selectedDate: Date? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screenWidth = self.view.bounds.width
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.itemSize = CGSize(width: screenWidth/8, height: screenWidth/8)
		layout.minimumInteritemSpacing = 1
		layout.minimumLineSpacing = 1
		collectionView!.collectionViewLayout = layout
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		
		dates.removeAll()
		
		startComps.year = startCompsYear
		startComps.month = startComsMonth
		startComps.day = 1
		
		endComps.year = endCompsYear
		endComps.month = endCompsMonth
		endComps.day = 29
		
		let startDate = FormatManager.persianCalendar.date(from: startComps)
		date = startDate
		endDate = FormatManager.persianCalendar.date(byAdding: .day, value: -1, to: FormatManager.persianCalendar.date(byAdding: .month, value: 1, to: startDate!)!)!
		
		topLabel.text = FormatManager.monthFormatter.string(from: startDate!) +  FormatManager.yearFormatter.string(from: startDate!)
		
		while date! <= endDate {
			dates.append(date!)
			date = FormatManager.persianCalendar.date(byAdding: .day, value: 1, to: date!)!
		}
		print(dates.count)
		print(dates)
		print("************")
		
		print(FormatManager.dateFormatter.string(from: startDate!))
		print(FormatManager.chandshanbeFormatter.string(from: startDate!))
		switch FormatManager.chandshanbeFormatter.string(from: startDate!) {
		case "شنبه":
			break
		case "یکشنبه":
			dates.insert(nil, at: 0)
		case "دوشنبه":
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
		case "سه‌شنبه":
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
		case "چهارشنبه":
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
		case "پنجشنبه":
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
		default:
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
			dates.insert(nil, at: 0)
		}
		
		
		let numberOfNilsAtEnd = 42 - dates.count
		for i in 1...numberOfNilsAtEnd {
			dates.append(nil)
		}
		print(dates)
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 42
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
		let date = dates[indexPath.row]
		
		if let date = date {
			
			if date == selectedDate {
				item.backgroundColor = .blue
			} else {
				if date.isToday(inCalendar: FormatManager.persianCalendar){
					item.backgroundColor = .red
				} else if date.isGreaterThanDate(Date()){
					item.backgroundColor = .gray
				} else {
					item.backgroundColor = .green
				}
			}
			
			item.dateLabel.text = FormatManager.dayFormatter.string(from: date)
			item.date = date
		} else {
			item.date = nil
			item.dateLabel.text = ""
			item.backgroundColor = .clear
		}
		item.setupCell()
		return item
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		//print("item:" +  String(describing: indexPath))
		let item = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
		if item.date == nil || item.backgroundColor == .gray {
			
		} else {
			
			selectedDate = item.date
			item.backgroundColor = .blue
			collectionView.reloadData()
		}
	}
	
	@IBAction func prevMonthPressed(_ sender: UIButton) {
		
		dates.removeAll()
		
		startComsMonth = startComsMonth - 1
		endCompsMonth = endCompsMonth - 1
		
		
		if startComsMonth == 0 {
			startComsMonth = 12
			endCompsMonth = 12
			endCompsYear = endCompsYear - 1
			startCompsYear = startCompsYear - 1
			//endday
		} else {
			//ok!
		}
		
		collectionView.reloadData()
	}

	@IBAction func nextMonthPressed(_ sender: UIButton) {
		
		dates.removeAll()
		
		startComsMonth = startComsMonth + 1
		endCompsMonth = endCompsMonth + 1
		if startComsMonth == 13 {
			startComsMonth = 1
			endCompsMonth = 1
			endCompsYear = endCompsYear + 1
			startCompsYear = startCompsYear + 1
		} else {
			//ok
		}
		collectionView.reloadData()
	}
}

