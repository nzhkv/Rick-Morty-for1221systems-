//
//  InfoDetailTableViewCellViewModel.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import Foundation

final class InfoDetailTableViewCellViewModel {
    public let speciesLabel: String = "Species:"
    public let speciesDetailLabel: String
    public let typeLabel: String = "Type:"
    public let typeDetailLabel: String
    public let genderLabel: String = "Gender:"
    public let genderDetailLabel: String
    
    init(speciesDetailLabel: String, typeDetailLabel: String, genderDetailLabel: String) {
        self.speciesDetailLabel = speciesDetailLabel
        self.typeDetailLabel = typeDetailLabel
        self.genderDetailLabel = genderDetailLabel
    }
}
