//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import Foundation
struct Repository: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let owner: User
}
