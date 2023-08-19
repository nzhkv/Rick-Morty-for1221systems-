//
//  Endpoint.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 19.08.2023.
//

import Foundation

@frozen enum Endpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
