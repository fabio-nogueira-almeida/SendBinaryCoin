//
//  RateRequest.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

struct RateRequest: NetworkRequestProtocol {
    var components: URLComponents

    init() {
        components = URLComponents()
        components.scheme = "https"
        components.host = "openexchangerates.org"
        components.path = "/api/latest.json"
        let queryItemQuery = URLQueryItem(name: "app_id",
                                          value: "1e66dc9e7c8a47bbb4fb48d7fd804605")
        components.queryItems = [queryItemQuery]
    }
}
