//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by 田辺信之 on 2019/02/05.
//  Copyright © 2019 田辺信之. All rights reserved.
//  APIクライアントの構成要素間の接続


import Foundation


class GitHubClient {
    // URLSessionクラスのインスタンスを一つ生成してそれを以後使い回すためこの実装
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func send<Request: GitHubRequest>(request: Request, completion: (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
        }
        task.resume()
    }
}
