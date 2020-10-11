//
//  APIService.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 07.07.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    //singleton
    static let shared = APIService()
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping([Episode]) -> ()) {
        
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string: secureFeedUrl) else { return }
        let parser    = FeedParser(URL: url)
        parser?.parseAsync(result: { (result) in
            print("Successfully parse feed:", result.isSuccess)
            
            if let err = result.error {
                print("Failed to parse XML feed:", err)
                return
            }
            
            guard let feed = result.rssFeed else { return }
            
            let episodes = feed.toEpisodes()
            completionHandler(episodes)
        })
    }
    
    // MARK: - Парсинг
    
    func fetchMusic() {
        
    }
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        print("Searching for podcasts...")
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        AF.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failure to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                print(searchResult.resultCount)
                completionHandler(searchResult.results)
                //получили имя трека и имя артиста и положили в массив
                //                self.podcasts = searchResult.results
                //                self.tableView.reloadData()
            } catch let decodeErr {
                print("Failed to decode:", decodeErr)
            }
        }
    }
    
    struct SearchResult: Decodable {
        let resultCount: Int
        let results:     [Podcast]
    }
    
}
