//
//  ImageTableViewCellViewModel.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import Foundation

final class ImageTableViewCellViewModel {
    public let cellImageView: URL?
    public let nameLabel: String
    public let statusLabel: String
    
    init(cellImageView: URL?, nameLabel: String, statusLabel: String) {
        self.cellImageView = cellImageView
        self.nameLabel = nameLabel
        self.statusLabel = statusLabel
    }
    

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = cellImageView else {
            completion(.failure(URLError(.badURL)))
            return
        }
//        ImageLoader.shared.downloadImage(url, completion: completion)
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
