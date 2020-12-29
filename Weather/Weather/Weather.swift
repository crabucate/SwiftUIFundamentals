//
//  Weather.swift
//  SwiftUI-Weather-SeanAllen
//
//  Created by Felix Leitenberger on 03.11.20.
//

import Foundation

struct WeatherResponse: Codable {
    let daily: [Day]
}

struct Day: Codable, Identifiable {
    var id = UUID()
    let sunrise: Int
    let temp: Temp
}

struct Temp: Codable {
    let day: Double
}


struct Weather: Identifiable {
    var id = UUID()
    var day: String
    var symbol: WeatherConditionSymbol
    var temp: String
}


enum WeatherConditionSymbol: String {
    case cloudy = "cloud.fill"
    case windy = "wind"
    case sunny = "sun.max.fill"
    case mixed = "cloud.sun.rain.fill"
    case thunder = "cloud.bolt.rain.fill"
}
