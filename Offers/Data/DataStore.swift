//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

protocol DataStore: class {
  func elements<T: Codable>() -> [T]
  func saveElements<T: Codable>(_ elements: [T])
}
