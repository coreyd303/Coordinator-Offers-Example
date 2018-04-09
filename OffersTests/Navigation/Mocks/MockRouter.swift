//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockRouter: Router {
  var invokedSetRootPresentable = false
  var invokedSetRootPresentableCount = 0
  var invokedSetRootPresentableParameters: (presentable: Presentable, Void)?
  var invokedSetRootPresentableParametersList = [(presentable: Presentable, Void)]()

  func setRootPresentable(_ presentable: Presentable) {
    invokedSetRootPresentable = true
    invokedSetRootPresentableCount += 1
    invokedSetRootPresentableParameters = (presentable, ())
    invokedSetRootPresentableParametersList.append((presentable, ()))
  }

  var invokedPush = false
  var invokedPushCount = 0
  var invokedPushParameters: (presentable: Presentable, Void)?
  var invokedPushParametersList = [(presentable: Presentable, Void)]()

  func push(_ presentable: Presentable) {
    invokedPush = true
    invokedPushCount += 1
    invokedPushParameters = (presentable, ())
    invokedPushParametersList.append((presentable, ()))
  }

  var invokedToPresent = false
  var invokedToPresentCount = 0
  var stubbedToPresentResult: UIViewController!

  func toPresent() -> UIViewController {
    invokedToPresent = true
    invokedToPresentCount += 1
    return stubbedToPresentResult
  }
}
