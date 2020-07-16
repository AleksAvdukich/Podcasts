//
//  Podcast.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 30.06.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName:     String?
    var artistName:    String?
    var trackCount:    Int?
    var artworkUrl600: String?
    var feedUrl:       String?
}

