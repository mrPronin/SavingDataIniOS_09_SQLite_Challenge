//
//  OTRSite.swift
//  OldTimeRadio
//
//  Created by Brian on 11/27/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class OTRSite {
  
  var name = ""
  var address = ""
  var isFree = false
  var isMembershipRequired = false
  
  init(name:String, address:String, isFree:Bool, isMembershipRequired:Bool) {
    self.name = name
    self.address = address
    self.isFree = isFree
    self.isMembershipRequired = isMembershipRequired
  }
  
}