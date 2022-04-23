//
//  UserModel.swift
//  ceibaApp (iOS)
//
//  Created by inicial on 22/4/22.
//

import Foundation



// MARK: - UserModelElement
struct UserModelElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias UserModel = [UserModelElement]
