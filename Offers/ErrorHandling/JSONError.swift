//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

enum JSONError: Error {
  case couldNotParse

  var localizedDescription: String {
    switch self {
    case .couldNotParse:
      return "Could not parse JSON"
    }
  }
}
