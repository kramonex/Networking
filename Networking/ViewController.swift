//
//  ViewController.swift
//  Networking
//
//  Created by kramonex on 04.05.2023.
//
import Foundation
import UIKit

enum Link {
    case mostPopular
    
    var url: URL {
        switch self {
        case .mostPopular:
            return URL(string:
                        "https://shikimori.me/api/animes?season=spring_2023&kind=tv&order=popularity&limit=1)")!
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAnime()
    }
    
    private func fetchAnime() {
        URLSession.shared.dataTask(with: Link.mostPopular.url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let animeList = try decoder.decode(Anime.self, from: data)
                print(animeList)
            } catch {
                print(error)
            }
        }.resume()
    }
}
