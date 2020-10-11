//
//  PlayerDetailsView.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 19.09.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            titleLabel.text  = episode.title
            authorLabel.text = episode.author
            
            guard let url = URL(string: episode.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    
}
