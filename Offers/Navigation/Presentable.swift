//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol Presentable: class, Presenter {
  func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
  func toPresent() -> UIViewController {
    return self
  }
}
