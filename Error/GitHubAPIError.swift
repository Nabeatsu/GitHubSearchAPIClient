//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import Foundation
struct GitHubAPIError: Decodable, Error {
    let message: String
}
