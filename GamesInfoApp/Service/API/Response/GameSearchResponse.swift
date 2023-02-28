// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameSearchResponse = try? JSONDecoder().decode(GameSearchResponse.self, from: jsonData)

import Foundation

// MARK: - GameSearchResponse
struct GameSearchResponse: Codable {
    let count: Int
    let next, previous: String?
    let results: [GameResponse]
    let userPlatforms: Bool?

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case userPlatforms = "user_platforms"
    }
}
