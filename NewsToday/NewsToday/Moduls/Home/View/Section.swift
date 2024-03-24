//
//  Sections.swift
//  NewsToday
//
//  Created by Анастасия on 20.03.2024.
//

import Foundation

enum Section: Int, CaseIterable {
    case categories
    case popular
    case recommended

    var columnCount: Int {
        switch self {
        case .categories:
            return 4
        case .popular:
            return 2
        case .recommended:
            return 1
        }
    }
}
