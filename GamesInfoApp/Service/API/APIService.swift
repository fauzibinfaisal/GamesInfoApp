//
//  APIService.swift
//  GamesInfoApp
//
//  Created by Gop-c2s2-f on 16/02/23.
//

import Foundation

class ApiService {
    let apiKey = Const.API_KEY
    let baseUrl = "https://api.rawg.io/api/"
    
    func getGamesList(page: Int, count: Int, completion: @escaping (Result<GameListResponse, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)games?page=\(page)&page_size=\(count)&key=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            do {
                let games = try JSONDecoder().decode(GameListResponse.self, from: data)
                completion(.success(games))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getGamesList(completion: @escaping (Result<GameListResponse, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)games?key=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            do {
                let games = try JSONDecoder().decode(GameListResponse.self, from: data)
                completion(.success(games))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func searchGames(query: String, completion: @escaping (Result<GameSearchResponse, Error>) -> Void) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "\(baseUrl)games?search=\(encodedQuery)&key=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            do {
                let games = try JSONDecoder().decode(GameSearchResponse.self, from: data)
                completion(.success(games))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getGameDetail(id: Int, completion: @escaping (Result<GameResponse, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)games/\(id)?key=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            do {
                let gameDetail = try JSONDecoder().decode(GameResponse.self, from: data)
                completion(.success(gameDetail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
