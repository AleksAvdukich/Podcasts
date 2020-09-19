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
    
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.title       = feedItem.title ?? ""
        self.pubDate     = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
