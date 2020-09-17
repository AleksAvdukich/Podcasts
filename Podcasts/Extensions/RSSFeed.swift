//
//  RSSFeed.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 17.09.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]()
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            
            episodes.append(episode)
        })
        return episodes
    }
    
}


