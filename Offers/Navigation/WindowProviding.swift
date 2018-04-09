//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol WindowProviding: class {
  func setRootPresentable(_ presentable: Presentable)
}

extension UIWindow: WindowProviding {
  func setRootPresentable(_ presentable: Presentable) {
    rootViewController = presentable.toPresent()
    makeKeyAndVisible()
  }
}
