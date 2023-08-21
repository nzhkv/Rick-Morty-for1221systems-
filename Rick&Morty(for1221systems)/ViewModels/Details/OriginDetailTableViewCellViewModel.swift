//
//  OriginDetailTableViewCellViewModel.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import UIKit

final class OriginDetailTableViewCellViewModel {
    private let planetImageView = UIImage(named: "Image")
    public let planetLabel: String
    public let planetDetailLabel: String = "Planet"
    
    init(planetLabel: String) {
        self.planetLabel = planetLabel
    }
}
