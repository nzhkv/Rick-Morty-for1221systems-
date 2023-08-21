//
//  Endpoint.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 19.08.2023.
//

import Foundation

@frozen enum Endpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
}
