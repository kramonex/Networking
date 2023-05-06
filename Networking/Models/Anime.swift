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
    let original: String
}




struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let number_of_lessons: Int
    let number_of_tests: Int
}

struct SwiftBookInfo: Decodable {
    let courses: [Course]
    let websiteDescription: String
    let websiteName: String
}

