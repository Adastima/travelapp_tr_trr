//
//  HotelTableViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2021/1/7.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

class HotelTableViewController: UITableViewController ,UISearchResultsUpdating  {


        
        var hotels: [Hotel] = []
        
        var searchController: UISearchController!
        
        var searchResults: [Hotel] = []
        
        
        // MARK: - Table view lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            loadHotels()
            if hotels.isEmpty {
                Hotel.generateDatas(sourceArray: &hotels)
            }
//
           navigationController?.navigationBar.prefersLargeTitles = true
//
           searchController = UISearchController(searchResultsController: nil)
            self.navigationItem.searchController = searchController
//
          // searchController.searchResultsUpdater = self            //not change the color of the search contents
            searchController.obscuresBackgroundDuringPresentation = false
        }
        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            if searchController.isActive {
                return searchResults.count
            }
            else {
                return hotels.count
           }
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cellIdentifier = "datacell1"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HotelTableViewCell

            // Configure the cell...
            // Determine if we get the restaurant from search result or the original array
            let hotel = (searchController.isActive) ? searchResults[indexPath.row] : hotels[indexPath.row]

            cell.nameLabel.text = hotel.name //optional chaining
            cell.locationLabel.text = hotel.location
            cell.websiteLabel.text = hotel.website
            cell.thumbnailImageView.image = UIImage(named: hotel.image)

            if hotels[indexPath.row].isVisited {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
            //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none

            return cell
        }

        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            if searchController.isActive {
                return false
            } else {
                return true
            }
        }



        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                // Delete the row from the data source
                self.hotels.remove(at: indexPath.row)

                self.tableView.deleteRows(at: [indexPath], with: .fade)

                // Call completion handler with true to indicate
                completionHandler(true)
            }

            let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
                let defaultText = "Just checking in at " + self.hotels[indexPath.row].name

                let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
                completionHandler(true)
            }


            let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])

            // Set the icon and background color for the actions
            deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
            //deleteAction.image = UIImage(systemName: "trash") //iOS 13
            deleteAction.image = UIImage(named: "delete")  //iOS 12


            shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
            //shareAction.image = UIImage(systemName: "square.and.arrow.up")
            shareAction.image = UIImage(named: "share") //iOS 12

            return swipeConfiguration
        }


        override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in

                let cell = tableView.cellForRow(at: indexPath) as! HotelTableViewCell
                self.hotels[indexPath.row].isVisited = (self.hotels[indexPath.row].isVisited) ? false : true
                cell.accessoryType = self.hotels[indexPath.row].isVisited ? .checkmark : .none

                completionHandler(true)
            }

            // let checkInIcon = restaurants[indexPath.row].isVisited ? "arrow.uturn.left" : "checkmark"
            let checkInIcon = hotels[indexPath.row].isVisited ? "undo" : "tick"
            checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
            //checkInAction.image = UIImage(systemName: checkInIcon)
            checkInAction.image = UIImage(named: checkInIcon)  //iOS 12

            let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])


            return swipeConfiguration
        }

        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showHotelDetail" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destination as! HotelDetailViewController
                    destinationController.hotel = (searchController.isActive) ? searchResults[indexPath.row] : hotels[indexPath.row]
                }
            }
          //  else if segue.identifier == "addHotel" {
            //    let destinationController = segue.destination as! UINavigationController
            //    let topView = destinationController.topViewController as! NewHotelController
             //   topView.addDelegates = self
           // }
        }


        //@IBAction func unwindToHome(segue: UIStoryboardSegue) {
        //    dismiss(animated: true, completion: nil)
       // }


        // MARK: - Data saving to the file

        func documentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }

        func dataFilePath() -> URL {
            return documentsDirectory().appendingPathComponent("Hotels.plist")
        }


        func saveHotels() {
            let encoder = PropertyListEncoder()
            do {
                let data = try encoder.encode(hotels)
                try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            } catch {
                print("Error encoding hotel array: \(error.localizedDescription)")
            }
        }

        func loadHotels() {
            let path = dataFilePath()
            if let data = try? Data(contentsOf: path) {
                let decoder = PropertyListDecoder()
                do {
                    hotels = try decoder.decode([Hotel].self, from: data)
                } catch {
                    print("Error decoding hotel array: \(error.localizedDescription)")
                }
            }
        }


        // MARK: - Search bar none core data version

        func filterContent(for searchText: String) {

            searchResults = hotels.filter({ (hotel) -> Bool in
                let name = hotel.name
                let isMatch = name.localizedCaseInsensitiveContains(searchText)

                return isMatch
            })
        }

        func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
                filterContent(for: searchText)
                tableView.reloadData()
            }
        }

    }

   // extension HotelTableViewController: AddDataDelegates {
      //  func addHotel(item: Hotel) {
       //     hotels.append(item)
        //    let tableView = view as! UITableView
         //   tableView.insertRows(at: [IndexPath(row: hotels.count-1, section: 0)], with: .automatic)
       // }
        
   
