//
//  GameListResponse.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameListResponse = try? JSONDecoder().decode(GameListResponse.self, from: jsonData)

import Foundation

// MARK: - GameListResponse
struct GameListResponse: Codable {
    let count: Int
    let next, previous: String?
    let results: [GameResponse]
    let seoTitle, seoDescription, seoKeywords, seoH1: String?
    let noindex, nofollow: Bool?
    let description: String?
    let filters: Filters?
    let nofollowCollections: [String]?

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description, filters
        case nofollowCollections = "nofollow_collections"
    }
}

// MARK: - Filters
struct Filters: Codable {
    let years: [FiltersYear]?
}

// MARK: - FiltersYear
struct FiltersYear: Codable {
    let from, to: Int?
    let filter: String?
    let decade: Int?
    let years: [YearYear]?
    let nofollow: Bool?
    let count: Int?
}

// MARK: - YearYear
struct YearYear: Codable {
    let year, count: Int?
    let nofollow: Bool?
}
