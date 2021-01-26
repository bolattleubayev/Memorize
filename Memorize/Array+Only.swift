//
//  Array+Only.swift
//  Memorize
//
//  Created by macbook on 26/01/2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
