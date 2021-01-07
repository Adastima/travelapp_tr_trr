//
//  HotelDetailViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2021/1/7.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

class HotelDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

        
        @IBOutlet var tableView: UITableView!
        @IBOutlet var headerView: RestaurantDetailHeaderView!
        
        var  hotel = Hotel()

        
        // MARK: - Table view data source
        func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
                        
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
    //        cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "phone")
            cell.shortTextLabel.text = hotel.phone
            cell.selectionStyle = .none
                        
            return cell
            case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
    //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = hotel.location
            cell.selectionStyle = .none
                        
            return cell
            case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = hotel.summary
            cell.selectionStyle = .none
            
            return cell
             
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
                cell.titleLabel.text = "HOW TO GET HERE"
                cell.selectionStyle = .none
                
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
                cell.selectionStyle = .none
                cell.configure(location: hotel.location)
                
                return cell
                
            default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
            }
        }
        
        
        // MARK: - Table view lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationItem.largeTitleDisplayMode = .never
            
            // Configure header view
            headerView.nameLabel.text = hotel.name
            headerView.websiteLabel.text = hotel.website
            headerView.headerImageView.image = UIImage(named: hotel.image)
            headerView.heartImageView.isHidden = (hotel.isVisited) ? false : true
            if !hotel.rating.isEmpty {
                headerView.ratingImageView.image = UIImage(named: hotel.rating)
            }

            tableView.delegate = self
            tableView.dataSource = self
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showMap" {
                let destinationController = segue.destination as! MapViewController
                destinationController.hotel = hotel
            }
            else if segue.identifier == "showReview" {
                let destinationController = segue.destination as! ReviewViewController
                destinationController.hotel = hotel
            }
        }
        
        @IBAction func close(segue: UIStoryboardSegue) {
            dismiss(animated: true, completion: nil)
        }
        
        @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
            if let rating = segue.identifier {
                self.hotel.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating)
            }

        dismiss(animated: true, completion: nil)
        }
    }
