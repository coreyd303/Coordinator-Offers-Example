//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

struct Offer: Codable, Equatable {
  let id: String
  let urlString: String?
  let name: String
  let description: String
  let terms: String
  let currentValue: String
  let favored: Bool
  var url: URL? {
    return urlString?.asURL()
  }

  enum CodingKeys: String, CodingKey {
    case id
    case urlString = "url"
    case name
    case description
    case terms
    case currentValue = "current_value"
    case favored
  }
}
