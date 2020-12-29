//
//  NetworkingManager.swift
//  SwiftUI-Weather-SeanAllen
//
//  Created by Felix Leitenberger on 08.11.20.
//

import Foundation

enum WError: Error {
    case notWork
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.openweathermap.org/data/2.5/onecall?"
    let coordinates = "lat=48.109200&lon=11.595089"
    let config = "exclude=hourly,minutely,alerts,current"
    let apiKey = "appid=7ac04a80e5af1e995726e2c0968c798d"
    
    private init() {}
    
    func getWeather(completion: @escaping (Result<[Day], WError>) -> Void) {
        
        let url = baseUrl + coordinates + "&" + config + "&" + apiKey
        print(url)
        
        guard let realUrl = URL(string: url) else {
            completion(.failure(.notWork))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: realUrl)) { (data, response, error) in
           
            if let _ = error {
                completion(.failure(.notWork))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.notWork))
                print("2")
                return
            }
            
            guard let data = data else {
                completion(.failure(.notWork))
                print("3")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(decodedResponse.daily))
            } catch {
                completion(.failure(.notWork))
                print("4")
            }

            
        }
        task.resume()
    }
}
