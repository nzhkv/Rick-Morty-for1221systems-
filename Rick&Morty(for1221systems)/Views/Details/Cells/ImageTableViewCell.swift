//
//  ImageTableViewCell.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 21.08.2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static let cellIdentifier = "PictureDetailCell"
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    init(frame: CGRect) {
//        init(frame: frame)
//        contentView.backgroundColor = .green
//        contentView.addSubviews(cellImageView, nameLabel, statusLabel)
//        addConstraints()
////        setUpLayer()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
            
            contentView.addSubviews(cellImageView, nameLabel, statusLabel)
            
            NSLayoutConstraint.activate([
                cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                cellImageView.heightAnchor.constraint(equalToConstant: 148),
                
                nameLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 24),
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                statusLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 57),
                statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }

    public func configure(with viewModel: ImageTableViewCellViewModel) {
        nameLabel.text = viewModel.nameLabel
        statusLabel.text = viewModel.statusLabel
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.cellImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
}
