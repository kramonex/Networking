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
        case test
    
    var url: URL {
        switch self {
        case .mostPopular:
            return URL(string:
                        "https://shikimori.me/api/animes?season=spring_2023&kind=tv&order=popularity&limit=10")!
        case .test:
            return URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")!
        }
    }
}
    
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAnime()
        //fetchTest()
    }
    
}

extension ViewController {
    private func fetchAnime() {
        URLSession.shared.dataTask(with: Link.mostPopular.url) { data, _,
            error in
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
    
    private func fetchTest() {
        URLSession.shared.dataTask(with: Link.test.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let test = try decoder.decode([Course].self, from: data)
                print(test)
            } catch {
                print(error)
            }
        }.resume()
    }
}


