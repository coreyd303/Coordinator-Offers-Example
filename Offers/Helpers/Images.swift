//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

enum Images: String {
  case heart = "Heart"
  case heartSelected = "HeartSelected"
  case placeholder = "Placeholder"

  var image: UIImage {
    return UIImage(named: self.rawValue) ?? UIImage()
  }
}
