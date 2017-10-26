//
//  DateService.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

class DateService {

  public static func date(_ byAddingDay: Int, toDate: Date) -> Date {
    return Calendar.current.date(byAdding: .day, value: byAddingDay, to: Date())!
  }

}
