//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import Foundation


// ベースURLとパスの定義
// GitHub APIのURLには共通の部分が多くあるため、URLをベースURLとパスの2つのプロパティにわけて、
// GitHubRequesプロトコルに定義する

protocol GitHubRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var body: Encodable? { get }
}


extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}


