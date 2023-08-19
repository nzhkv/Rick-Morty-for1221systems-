//
//  GetAllCharactersResponse.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 20.08.2023.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Character]
}
