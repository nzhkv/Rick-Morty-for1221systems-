//
//  ViewController.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 19.08.2023.
//

import UIKit

/// Controller to show info about single character
final class CharacterDetailViewController: UIViewController {
    private let viewModel: CharacterDetailViewViewModel
//
//    private let detailView: CharacterDetailView
//
//    // MARK: - Init
//
    init(viewModel: CharacterDetailViewViewModel) {
        self.viewModel = viewModel
//        self.detailView = CharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        title = viewModel.title
//        view.addSubview(detailView)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .action,
//            target: self,
//            action: #selector(didTapShare)
//        )
//        addConstraints()
//
//        detailView.collectionView?.delegate = self
//        detailView.collectionView?.dataSource = self
//    }
//
//    @objc
//    private func didTapShare() {
//        // Share character info
//    }
//
//    private func addConstraints() {
//        NSLayoutConstraint.activate([
//            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//}
//
//// MARK: - CollectionView
//
//extension CharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return viewModel.sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let sectionType = viewModel.sections[section]
//        switch sectionType {
//        case .photo:
//            return 1
//        case .information(let viewModels):
//            return viewModels.count
//        case .episodes(let viewModels):
//            return viewModels.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let sectionType = viewModel.sections[indexPath.section]
//        switch sectionType {
//        case .photo(let viewModel):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CharacterPhotoCollectionViewCell.cellIdentifer,
//                for: indexPath
//            ) as? CharacterPhotoCollectionViewCell else {
//                fatalError()
//            }
//            cell.configure(with: viewModel)
//            return cell
//        case .information(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CharacterInfoCollectionViewCell.cellIdentifer,
//                for: indexPath
//            ) as? CharacterInfoCollectionViewCell else {
//                fatalError()
//            }
//            cell.configure(with: viewModels[indexPath.row])
//            return cell
//        case .episodes(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CharacterEpisodeCollectionViewCell.cellIdentifer,
//                for: indexPath
//            ) as? CharacterEpisodeCollectionViewCell else {
//                fatalError()
//            }
//            let viewModel = viewModels[indexPath.row]
//            cell.configure(with: viewModel)
//            return cell
//        }
//    }
}
