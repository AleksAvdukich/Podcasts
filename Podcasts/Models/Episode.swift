//
//  Episode.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 17.09.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title:       String
    let pubDate:     Date
    let description: String
    let author:      String
    let streamUrl:   String
    
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.streamUrl   = feedItem.enclosure?.attributes?.url ?? ""
        
        self.title       = feedItem.title ?? ""
        self.pubDate     = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        
        self.author      = feedItem.iTunes?.iTunesAuthor ?? ""
        
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
