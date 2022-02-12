//
//  Network.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

protocol NetworkRequestProtocol {
    var components: URLComponents { get }
}

public typealias ResponseResult = (Result<Any, Error>) -> Void

struct Network {
    func request<T: Decodable>(url: URL,
                               response: T.Type,
                               completion: ResponseResult?) {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            if let data = data {

                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    completion?(.success(response))
                } catch {
                    completion?(.failure(error))
                }
            } else {
                if let error = error {
                    completion?(.failure(error))
                }
            }
        }

        task.resume()
    }
}
