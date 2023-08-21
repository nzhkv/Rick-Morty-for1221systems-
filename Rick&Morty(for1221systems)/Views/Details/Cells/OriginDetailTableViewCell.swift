//
//  OriginDetailTableViewCell.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import UIKit

class OriginDetailTableViewCell: UITableViewCell {
    static let cellIdentifier = "OriginDetailCell"
    
    let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let planetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let planetDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.backgroundColor = UIColor(red: 0.149, green: 0.165, blue: 0.22, alpha: 1).cgColor
        contentView.layer.cornerRadius = 16
        
        contentView.addSubviews(planetImageView, planetLabel, planetDetailLabel)
        
        NSLayoutConstraint.activate([
            planetImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            planetImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            planetImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
 
            planetLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            planetLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 16),
            
            planetDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            planetDetailLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        planetLabel.text = nil
    }
    
    public func configure(with viewModel: OriginDetailTableViewCellViewModel) {
        planetLabel.text = viewModel.planetLabel
    }
}
