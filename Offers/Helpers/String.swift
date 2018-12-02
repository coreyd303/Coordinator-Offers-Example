//
// Created by Phillip Beadle on 2018-12-01.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

extension String {
  func asURL() -> URL? {
    return URL(string: self)
  }
}