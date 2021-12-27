//
//  Movie.swift
//  WalmartLastMileMobileTeam
//
//  Created by Home on 12/14/21.
//

import Foundation

struct Result: Codable{
    let results: [Movie]
}
struct Movie: Codable{
    let id: Int?
    let popularity: Float?
    let title: String?
    let release_date: String?
    let poster_path: String?
    let overview: String?
    let genre_ids: [Int]?
}


struct Genres: Codable {
    let genres : [Genre]?
}
struct Genre: Codable{
    let id : Int?
    let name: String?
}

private enum CodingKeys:String, CodingKey{
    case id = "id"
    case popularity = "popularity"
    case title = "title"
    case release_date = "release_date"
    case poster_path = "poster_path"
    case overview = "overview"
    case genre_ids = "genre_ids"
    case genres = "genres"
    case name = "name"
}
