//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import SwiftyJSON

struct Offer: Equatable {
  let id: Int
  let url: URL?
  let name: String
  let description: String
  let terms: String
  let currentValue: String
}

extension Offer {
  init(json: JSON) throws {
    id = json["id"].intValue
    url = URL(string: json["url"].stringValue)
    name = json["name"].stringValue
    description = json["description"].stringValue
    terms = json["terms"].stringValue
    currentValue = json["current_value"].stringValue
  }
}
