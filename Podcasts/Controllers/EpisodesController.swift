//
//  EpisodesController.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 20.07.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class EpisodesController: UITableViewController {
    
    var podcast: Podcast! {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    fileprivate let cellId = "cellId"
    
    struct Episode {
        let title: String
    }
    
    var episodes = [
        Episode(title: "First Episode"),
        Episode(title: "Second Episode"),
        Episode(title: "Third Episode")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup Work
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = self.episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
}
