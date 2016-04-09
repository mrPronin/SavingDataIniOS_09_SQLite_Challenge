
//
//  OTRLibrary.swift
//  OldTimeRadio
//
//  Created by Brian on 11/28/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class OTRLibraryManager {
  
  static let sharedInstance = OTRLibraryManager()
  private init() {
  }
  
  var otrSites = [OTRSite]()
  var otrShows = [OTRShow]()
  var otrEpisodes = [OTREpisode]()
  var otrFavorites = [OTRFavorite]()
  
  
  func loadFromPlist() {
    
    guard let otrPlistUrl = NSBundle.mainBundle().URLForResource("old_time_radio", withExtension: "plist") else {
      return
    }
    if let plistData = NSData(contentsOfURL: otrPlistUrl) {
      var format = NSPropertyListFormat.XMLFormat_v1_0
      do {
        let otrData = try NSPropertyListSerialization.propertyListWithData(plistData, options: .Immutable, format: &format)
        
        if let sites = otrData["Sites"] as? [[String : AnyObject]] {
          for site in sites {
            let name = site["Name"] as! String
            let address = site["Address"] as! String
            let isFree = site["Is Free"] as! Bool
            let membershipRequired = site["Membership Required"] as! Bool
            
            let otrSite = OTRSite(name: name, address: address, isFree: isFree, isMembershipRequired: membershipRequired)
            otrSites.append(otrSite)
          }
        }
        if let shows = otrData["Shows"] as? [[String : AnyObject]] {
          for show in shows {
            let showId = show["Id"] as! Int
            let title = show["Title"] as! String
            let thumbnail = show["Thumbnail"] as! String
            let description = show["Description"] as! String
            
            let otrShow = OTRShow(title: title, thumbnailFileName: thumbnail, showDescription: description, showId: showId)
            otrShows.append(otrShow)
          }
        }
        
        if let episodes = otrData["Episodes"] as? [[String : AnyObject]] {
          for episode in episodes {
            let showId = episode["Show Id"] as! Int
            let episodeId = episode["Episode Id"] as! Int
            let title = episode["Title"] as! String
            let broadcastDate = episode["Broadcast Date"] as! NSDate
            let fileLocation = episode["File Location"] as! String
            
            for show in otrShows {
              if showId == show.showId {
                let otrEpisode = OTREpisode(title: title, parentShow: show, broadcastDate: broadcastDate, episodeId: episodeId, fileLocation: fileLocation)
                otrEpisodes.append(otrEpisode)
                break
              }
            }
            
          }
        }
        
        if let favorites = otrData["Favorites"] as? [[String : AnyObject]] {
          for favorite in favorites {
            let episodeId = favorite["Episode Id"] as! Int
            let note = favorite["Note"] as! String
            let date = favorite["Favorite Date"] as! NSDate
            for episode in otrEpisodes {
              if episode.episodeId == episodeId {
                let otrFavorite = OTRFavorite(episode: episode, favoriteDate: date, note: note)
                otrFavorites.append(otrFavorite)
                break
              }
            }
          }
        }
        
      } catch {
        print(error)
      }
    }
    
  }
  
  func boolToInt(boolValue:Bool) -> Int {
    if boolValue == true {
      return 1
    }
    return 0
  }
  
  
}