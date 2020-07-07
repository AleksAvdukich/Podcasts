//
//  PodcastsSearchController.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 30.06.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [
        Podcast(trackName: "LBTA", artistName: "Briang Voong"),
        Podcast(trackName: "Some Podcasts", artistName: "Aleks Avdukich")
    ]
    
    let cellId = "cellId"
    
    //делаем SearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    // MARK: - Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    // Получаем данные по url
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(1)
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = UIImage.init(named: "appicon")
        
        return cell
    }
    
}
