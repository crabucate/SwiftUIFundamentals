//
//  User.swift
//  Appetizers
//
//  Created by Felix Leitenberger on 16.12.20.
//

import Foundation

struct User: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthdate           = Date()
    var extraNapkins        = false
    var frequentRefills     = false
}
