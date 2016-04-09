//
//  OTRFavorite.swift
//  OldTimeRadio
//
//  Created by Brian on 11/27/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class OTRFavorite {
  
  var episode: OTREpisode
  var favoriteDate: NSDate
  var note = ""
  
  init(episode:OTREpisode, favoriteDate:NSDate, note:String) {
    self.episode = episode
    self.favoriteDate = favoriteDate
    self.note = note
  }
  
}