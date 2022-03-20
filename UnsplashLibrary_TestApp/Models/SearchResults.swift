//
//  SearchResults.swift
//  UnsplashLibrary_TestApp
//
//  Created by Nechaev Sergey  on 19.03.2022.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]

    enum URLKind: String {
        case raw, full, regular, small, thumb
    }
}
