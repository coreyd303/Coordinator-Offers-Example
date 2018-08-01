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
  func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {
    rootController.present(presentable, animated: animated, completion: completion)
  }

  func dismiss(animated: Bool, completion: (() -> Void)?) {
    rootController.dismiss(animated: animated, completion: completion)
  }

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
