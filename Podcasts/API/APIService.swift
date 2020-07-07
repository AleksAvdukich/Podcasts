//
//  APIService.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 07.07.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    //singleton
    static let shared = APIService()
    
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
                print(3)
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
        print(2)
    }
    
    struct SearchResult: Decodable {
        let resultCount: Int
        let results:     [Podcast]
    }
    
}
