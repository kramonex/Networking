//
//  File.swift
//  Networking
//
//  Created by kramonex on 04.05.2023.
//

import Foundation

//struct AnimeList: Decodable {
//    let animes: [Anime]
//}

struct Anime: Decodable {
    let id: Int
//    let russian: String
//    let image: String
//    let kind: String
//    let score: String
//    let status: String
}

struct Image: Decodable {
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

