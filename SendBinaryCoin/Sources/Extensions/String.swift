//
//  NSLocalization.swift
//  SendBinaryCoin
//
//  Created by Fabio Nogueira on 12/02/22.
//

import Foundation

// MARK: - Localized

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
