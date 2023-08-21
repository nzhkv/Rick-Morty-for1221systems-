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
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "Image") {
              imageView.image = image
          }
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let square: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 64).isActive = true
        view.heightAnchor.constraint(equalToConstant: 64).isActive = true
        view.backgroundColor = UIColor(red: 0.098, green: 0.11, blue: 0.165, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let planetLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Gilroy-SemiBold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let planetDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Planet"
        label.textColor = UIColor(red: 0.278, green: 0.775, blue: 0.045, alpha: 1)
        label.font = UIFont(name: "Gilroy-Medium", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.backgroundColor = UIColor(red: 0.149, green: 0.165, blue: 0.22, alpha: 1).cgColor
        contentView.layer.cornerRadius = 16
        isUserInteractionEnabled = false
        square.addSubview(planetImageView)
        contentView.addSubviews(square, planetLabel, planetDetailLabel, planetImageView)
        
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            planetImageView.centerYAnchor.constraint(equalTo: square.centerYAnchor),
            
            square.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            square.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            square.widthAnchor.constraint(equalToConstant: 100),
            square.heightAnchor.constraint(equalToConstant: 100),
            
            planetLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            planetLabel.leadingAnchor.constraint(equalTo: square.trailingAnchor, constant: 16),
            
            planetDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            planetDetailLabel.leadingAnchor.constraint(equalTo: square.trailingAnchor, constant: 16)
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
