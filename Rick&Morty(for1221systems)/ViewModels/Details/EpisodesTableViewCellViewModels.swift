////
////  EpisodesTableViewCellViewModels.swift
////  Rick&Morty(for1221systems)
////
////  Created by Nikolay Zhukov on 21.08.2023.
////
//
//import UIKit
//
//protocol EpisodeDataRender {
//    var nameLabel: String { get }
//    var episodeLabel: String { get }
//    var dateLabel: String { get }
//}
//
//
//final class EpisodesTableViewCellViewModels {
//    private let episodeDataUrl: URL?
//    private var isFetching = false
//    private var dataBlock: ((EpisodeDataRender) -> Void)?
//
//    public let borderColor: UIColor
//
//    private var episode: Episode? {
//        didSet {
//            guard let model = episode else {
//                return
//            }
//            dataBlock?(model)
//        }
//    }
//
//    // MARK: - Init
//
//    init(episodeDataUrl: URL?, borderColor: UIColor = .systemBlue) {
//        self.episodeDataUrl = episodeDataUrl
//        self.borderColor = borderColor
//    }
//
//    // MARK: - Public
//
//    public func registerForData(_ block: @escaping (EpisodeDataRender) -> Void) {
//        self.dataBlock = block
//    }
//
//    public func fetchEpisode() {
//        guard !isFetching else {
//            if let model = episode {
//                dataBlock?(model)
//            }
//            return
//        }
//
//        guard let url = episodeDataUrl,
//              let request = Request(url: url) else {
//            return
//        }
//
//        isFetching = true
//
//        Service.shared.execute(request, expecting: Episode.self) { [weak self] result in
//            switch result {
//            case .success(let model):
//                DispatchQueue.main.async {
//                    self?.episode = model
//                }
//            case .failure(let failure):
//                print(String(describing: failure))
//            }
//        }
//    }
//
////    func hash(into hasher: inout Hasher) {
////        hasher.combine(self.episodeDataUrl?.absoluteString ?? "")
////    }
//
////    static func == (lhs: EpisodesTableViewCellViewModels, rhs: EpisodesTableViewCellViewModels) -> Bool {
////        return lhs.hashValue == rhs.hashValue
////    }
//}
//
//
//
//
//
//
//
////final class EpisodesTableViewCellViewModels {
////    public let nameLabel: String
////    public let episodeLabel: String
////    public let dateLabel: String
////
////    init(nameLabel: String, episodeLabel: String, dateLabel: String) {
////        self.nameLabel = nameLabel
////        self.episodeLabel = episodeLabel
////        self.dateLabel = dateLabel
////    }
////}
//
