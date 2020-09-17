//
//  String.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 17.09.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}



