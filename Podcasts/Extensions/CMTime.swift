//
//  CMTime.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 12.11.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
    
}
