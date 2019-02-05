//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import Foundation
struct GitHubAPIError: Decodable, Error {
    struct FieldError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
    let message: String
    let fieldErrors: [FieldError]
}
