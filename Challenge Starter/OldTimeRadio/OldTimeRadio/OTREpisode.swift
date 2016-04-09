//
//  OTREpisode.swift
//  OldTimeRadio
//
//  Created by Brian on 11/27/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class OTREpisode: CustomStringConvertible {
  
  var description: String {
    return "\(title) - \(broadcastDate) - \(parentShow)"
  }
  
  var title = ""
  var parentShow: OTRShow
  var broadcastDate: NSDate
  var fileLocation = ""
  weak var favorite: OTRFavorite?
  var episodeId = 0
  
  init(title:String, parentShow:OTRShow, broadcastDate:NSDate, episodeId:Int, fileLocation:String) {
    self.title = title
    self.parentShow = parentShow
    self.broadcastDate = broadcastDate
    self.episodeId = episodeId
    self.fileLocation = fileLocation
  }
  
}