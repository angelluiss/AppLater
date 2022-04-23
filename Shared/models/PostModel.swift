//
//  PostModel.swift
//  ceibaApp (iOS)
//
//  Created by inicial on 22/4/22.
//

import Foundation

// MARK: - PostModelElement
struct PostModelElement: Codable {
    let userID, id: Int?
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}

typealias PostModel = [PostModelElement]
