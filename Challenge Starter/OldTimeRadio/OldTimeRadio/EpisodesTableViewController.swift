//
//  EpisodesTableViewController.swift
//  OldTimeRadio
//
//  Created by Brian on 11/28/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

  var manager:OTRLibraryManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    manager = OTRLibraryManager.sharedInstance
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return manager.otrEpisodes.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("EpisodeCell", forIndexPath: indexPath)
    let episode = manager.otrEpisodes[indexPath.row]
    cell.textLabel?.text = episode.title

    return cell
  }

}
