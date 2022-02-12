//
//  ExchangeCoin.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

struct Exchange {
    static func binary(from decimal: Int) -> String {
        String(decimal, radix: 2)
    }

    static func decimal(from binary: String) -> Int? {
        Int(binary, radix: 2)
    }
}
