////
////  EpisodesTableViewCell.swift
////  Rick&Morty(for1221systems)
////
////  Created by Nikolay Zhukov on 21.08.2023.
////
//
//import UIKit
//
//protocol EpisodeDataRender {
//    var name: String { get }
//    var air_date: String { get }
//    var episode: String { get }
//}
//
//class EpisodesTableViewCell: UITableViewCell {
//    static let cellIdentifier = "EpisodesTableViewCell"
//    
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let episodeLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .green
//        
//        contentView.addSubviews(nameLabel, episodeLabel, dateLabel)
//        
//        
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            
//            // Ограничения для episodeLabel
//            episodeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//            episodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            
//            // Ограничения для dateLabel
//            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text = nil
//        episodeLabel.text = nil
//        dateLabel.text = nil
//    }
//    
//    public func configure(with viewModel: EpisodesTableViewCellViewModels) {
//        nameLabel.text = viewModel.nameLabel
//        episodeLabel.text = viewModel.episodeLabel
//        dateLabel.text = viewModel.dateLabel
//        
//    }
//    
//    
//}
