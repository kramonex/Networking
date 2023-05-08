//
//  ViewController.swift
//  Networking
//
//  Created by kramonex on 04.05.2023.
//
import Foundation
import UIKit

enum LinkTest {
    case mostPopular
    case threeRandomAnimeScoreOverSeven
    
    var url: URL {
        switch self {
        case .mostPopular:
            return URL(string:
                        "https://shikimori.me/api/animes?season=spring_2023&kind=tv&order=popularity&limit=10")!
        case .threeRandomAnimeScoreOverSeven:
            return URL(string: "https://shikimori.me/api/animes?kind=tv&order=random&limit=3&score=7")!
        }
    }
}
    
final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAnime()
        fetchRandomAnime()
    }
    
}

extension MainViewController {
    private func fetchAnime() {
        URLSession.shared.dataTask(with: Link.mostPopular.url)
        { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let animes = try decoder.decode([Anime].self, from: data)
                print(animes)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func fetchRandomAnime(){
        URLSession.shared.dataTask(with: Link.threeRandomAnimeScoreOverSeven.url)
        { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let animesRandom = try decoder.decode([Anime].self, from: data)
                print(animesRandom)
            } catch {
                print(error)
            }
        }.resume()
    }
}


