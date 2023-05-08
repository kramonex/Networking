//
//  File.swift
//  Networking
//
//  Created by kramonex on 04.05.2023.
//

import Foundation


struct Anime: Decodable {
    let russian: String
    let image: AnimeImage
    let kind: String
    let score: String
    let status: String
}

struct AnimeImage: Decodable {
    let preview: String
}




