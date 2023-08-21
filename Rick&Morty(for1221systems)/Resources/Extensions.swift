//
//  Extensions.swift
//  Rick&Morty(for1221systems)
//
//  Created by Nikolay Zhukov on 20.08.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
