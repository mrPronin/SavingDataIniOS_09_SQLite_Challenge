//
//  OTRShow.swift
//  OldTimeRadio
//
//  Created by Brian on 11/27/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class OTRShow: CustomStringConvertible {
  
  var description:String {
    return "\(title) - \(showDescription)"
  }

  var title = ""
  var thumbnailFileName = ""
  var showDescription = ""
  var showId = 0
  
  init(title:String, thumbnailFileName:String, showDescription:String, showId:Int) {
    self.title = title
    self.thumbnailFileName = thumbnailFileName
    self.showDescription = showDescription
    self.showId = showId
  }
  
}