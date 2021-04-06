//
//  BooksModel.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import Foundation

struct BooksModel: Codable {
    var title: String
    var thumbnail: String
    var shortDescription: String
    var longDescription: String
    var authors: [String]
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail = "thumbnailUrl"
        case shortDescription
        case longDescription
        case authors
    }
}
