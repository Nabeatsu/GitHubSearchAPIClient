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
    
    func send<Request: GitHubRequest>(request: Request, completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
            // 通信の正否はクロージャの引数の(data, response, error)から判別する
            // このタプルの方は(Data?, URLResponse?, Error?)
            // errorがnilでない場合は通信に失敗しているのでResult(error: connectionErrorを呼び出し元に返す
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
                
            case (let data?, let response?, _):
                do {
                    let response = try request.response(
                        from: data,
                        urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination \(String(describing: data)), \(String(describing: response)), \(String(describing: error))")
            }
        }
        task.resume()
    }
}
