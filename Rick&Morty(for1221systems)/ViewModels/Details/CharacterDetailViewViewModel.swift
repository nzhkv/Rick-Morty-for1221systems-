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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if section == 1 {
            return "Info"
        } else {
            return "Origin"
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
//            headerView.backgroundColor = UIColor.lightGray
            
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
            titleLabel.font = UIFont(name: "Gilroy-SemiBold", size: 17)
            titleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            
            headerView.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
                titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
                titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
            ])
            
            return headerView
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ImageTableViewCell.cellIdentifier,
                for: indexPath) as? ImageTableViewCell else {
                fatalError("Unsupported cell")
            }
            cell.configure(
                with: ImageTableViewCellViewModel(
                    cellImageView: URL(string: character.image),
                    nameLabel: character.name, statusLabel:
                        character.status.rawValue
                ))
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: InfoDetailTableViewCell.cellIdentifier,
                for: indexPath) as? InfoDetailTableViewCell else {
                fatalError("Unsupported cell")
            }
            
            cell.configure(with: InfoDetailTableViewCellViewModel(
                speciesDetailLabel: character.species,
                typeDetailLabel: character.type,
                genderDetailLabel: character.gender.rawValue
            ))
            if cell.typeDetailLabel.text == "" {
                cell.typeDetailLabel.text = "None"
            }
            
            return cell
        }
        
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OriginDetailTableViewCell.cellIdentifier,
                for: indexPath) as? OriginDetailTableViewCell else {
                fatalError("Unsupported cell")
            }
            
            cell.configure(with: OriginDetailTableViewCellViewModel(
                planetLabel: character.origin.name
            ))
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 230
        }
        
        if indexPath.section == 1 {
            return 124
        }
        
        if indexPath.section == 2 {
            return 80
        }
        
        return 20
    }
    
    
}
