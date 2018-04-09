//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol Router: Presentable {
  func setRootPresentable(_ presentable: Presentable)
  func push(_ presentable: Presentable)
}

class RouterImplementation: Router {
  let rootController: UINavigationController

  init(rootController: UINavigationController) {
    self.rootController = rootController
  }

  func setRootPresentable(_ presentable: Presentable) {
    rootController.setViewControllers([presentable.toPresent()], animated: false)
  }

  func push(_ presentable: Presentable) {
    rootController.pushViewController(presentable.toPresent(), animated: true)
  }

  func toPresent() -> UIViewController {
    return rootController
  }
}
