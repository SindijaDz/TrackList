//
//  TrackListTableViewController.swift
//  TrackList
//
//  Created by sindija.dzintare on 02/09/2020.
//  Copyright © 2020 sindija.dzintare. All rights reserved.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
    //    var trackList = [
    //        "Carly Rae Japsen - Dedicated",
    //        "Dj Khaled - father of",
    //        "Injury Reserve - Jailbrake",
    //        "Jonas Brothers - Happiness Begins ",
    //        "Joyner Lucas - adhd",
    //        "Maluma - 11-11",
    //        "Never Young - LOSER",
    //        "Rammstein - rammstein",
    //        "Skepta - Ignorance Is Bliss",
    //        "Skillet - Victory",
    //        "Tylor the Creator - IGOR",
    //        "YG - Stop Snitching",
    //    ]
    //Shorter code - possible cause struct of songs is created in "Song.swift" info taken from "DataManager.swift"
    var songs = Song.createSong()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackListCell", for: indexPath)
        //        cell.textLabel?.text = trackList[indexPath.row]
        //        cell.detailTextLabel?.text = trackList[indexPath.row] // This adds the sub title
        //        cell.textLabel?.numberOfLines = 0 // This will make sure text is on multiple lines
        //        cell.imageView?.image = UIImage(named: trackList[indexPath.row])
        //Shorter code:
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.track
        cell.detailTextLabel?.text = song.album
        cell.imageView?.image = UIImage(named: song.cover)
        // Configure the cell...
        
        return cell
    }
    
    //MARK: - TABLE VIEW DELEGATE
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentTrack = songs.remove(at: fromIndexPath.row)
        songs.insert(currentTrack, at: to.row)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.none
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            print(indexPath.row)
            let detailVC = segue.destination as! DetailViewController
            detailVC.song = songs[indexPath.row]
        }
    }
    
    
}
