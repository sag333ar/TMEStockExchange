//
//  NumberService.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

class NumberService {

  public static func random(_ from: Int, to: Int) -> Int {
    let number = to - from + 1
    return Int(arc4random_uniform(UInt32(number+from)))
  }

}
