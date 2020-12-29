//
//  APError.swift
//  Appetizers
//
//  Created by Felix Leitenberger on 10.12.20.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
