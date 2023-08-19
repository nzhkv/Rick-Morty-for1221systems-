//
//  ViewController.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 19.08.2023.
//

import UIKit

final class CharacterViewController: UIViewController, CharacterListViewDelegate {

    private let characterListView = CharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.016, green: 0.047, blue: 0.118, alpha: 1)
        title = "Characters"
        setUpView()
    }

    private func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - RMCharacterListViewDelegate
    
    /// открываем detail controller
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = CharacterDetailViewViewModel(character: character)
        let detailVC = CharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
