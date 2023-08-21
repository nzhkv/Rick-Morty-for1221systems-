//
//  CharacterDetailViewViewModel.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 19.08.2023.
//

import UIKit

final class CharacterDetailViewViewModel: NSObject {
    private let character: Character

    public var episodes: [String] {
        character.episode
    }

    init(character: Character) {
        self.character = character
    }

    public var title: String {
        character.name.uppercased()
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: character.url) else {
            completion(.failure(URLError(.badURL)))
            return
        }

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

extension CharacterDetailViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ImageTableViewCell.cellIdentifier,
                for: indexPath) as? ImageTableViewCell else {
                    fatalError("Unsupported cell")
                }
            cell.configure(with: ImageTableViewCellViewModel(
                cellImageView: URL(string: character.image),
                nameLabel: character.name, statusLabel:
                    character.status.rawValue))
//            cell.nameLabel.text = character.name
//            cell.statusLabel.text = character.status.rawValue
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 0 {
                // Возвращайте высоту ячейки с учетом высоты изображения и других элементов
                let imageHeight: CGFloat = 148 // Высота изображения
                let nameLabelHeight: CGFloat = 20 // Высота UILabel
                let statusLabelHeight: CGFloat = 20 // Высота UILabel
                let spacing: CGFloat = 16 // Вертикальные отступы
                
                return imageHeight + nameLabelHeight + statusLabelHeight + spacing * 3 // Общая высота
            }
            
            // Возвращайте высоту для остальных ячеек
            return 44 // Например, стандартная высота для остальных ячеек
        }
    
    
}
