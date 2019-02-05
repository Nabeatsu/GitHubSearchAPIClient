//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//

// GitHubの検索APIは今回利用するリポジトリの検索だけでなくユーザーやコードなどさまざまなものを検索できる
// いずれのレセ雨ポンスもtotal_countプロパティとitemsプロパティを持っており、検索対象に応じてitemsプロパティの配列の要素のデータ型が変わる。
// 1つの型で様々な種類な検索結果を汎用的に扱えるようにGeneric型を使う。

import Foundation

// JSONからインスタンス化が必要なのでItemもSearchRepositoryもDecodableの型制約を付ける
struct SearchRepository<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
