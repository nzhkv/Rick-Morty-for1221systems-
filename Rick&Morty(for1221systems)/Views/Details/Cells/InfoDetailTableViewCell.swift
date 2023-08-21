//
//  InfoDetailTableViewCell.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import UIKit

class InfoDetailTableViewCell: UITableViewCell {
    static let cellIdentifier = "TypeDetailCell"
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species:"
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let speciesDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.text = "Type:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 0.768, green: 0.789, blue: 0.808, alpha: 1)
        label.text = "Gender:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.backgroundColor = UIColor(red: 0.149, green: 0.165, blue: 0.22, alpha: 1).cgColor
        contentView.layer.cornerRadius = 16
        isUserInteractionEnabled = false
        contentView.addSubviews(speciesLabel, speciesDetailLabel, typeLabel, typeDetailLabel, genderLabel, genderDetailLabel)
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            speciesDetailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesDetailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            typeDetailLabel.topAnchor.constraint(equalTo: speciesDetailLabel.bottomAnchor, constant: 16),
            typeDetailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            genderDetailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            genderDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        speciesDetailLabel.text = nil
        typeDetailLabel.text = nil
        genderDetailLabel.text = nil
    }
    
    public func configure(with viewModel: InfoDetailTableViewCellViewModel) {
        speciesDetailLabel.text = viewModel.speciesDetailLabel
        typeDetailLabel.text = viewModel.typeDetailLabel
        genderDetailLabel.text = viewModel.genderDetailLabel
        
    }
    
    
}
