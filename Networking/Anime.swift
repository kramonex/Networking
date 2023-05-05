//
//  File.swift
//  Networking
//
//  Created by kramonex on 04.05.2023.
//

import Foundation


struct Anime: Decodable {
    let russian: String
    let image: Image
    let kind: String
    let score: String
    let status: String
}

struct Image: Decodable {
    let original: String
}

