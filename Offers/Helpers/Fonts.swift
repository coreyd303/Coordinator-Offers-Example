//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

enum Fonts: String {
  case demiBold = "AvenirNext-DemiBold"
  case regular = "AvenirNext-Regular"

  func font(withSize size: CGFloat) -> UIFont {
    return UIFont(name: self.rawValue, size: size) ?? UIFont()
  }
}
