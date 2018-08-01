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

  var invokedPresent = false
  var invokedPresentCount = 0
  var invokedPresentParameters: (presentable: Presentable, animated: Bool)?
  var invokedPresentParametersList = [(presentable: Presentable, animated: Bool)]()
  var shouldInvokePresentCompletion = false

  func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {
    invokedPresent = true
    invokedPresentCount += 1
    invokedPresentParameters = (presentable, animated)
    invokedPresentParametersList.append((presentable, animated))
    if shouldInvokePresentCompletion {
      completion?()
    }
  }

  var invokedDismiss = false
  var invokedDismissCount = 0
  var invokedDismissParameters: (animated: Bool, Void)?
  var invokedDismissParametersList = [(animated: Bool, Void)]()
  var shouldInvokeDismissCompletion = false

  func dismiss(animated: Bool, completion: (() -> Void)?) {
    invokedDismiss = true
    invokedDismissCount += 1
    invokedDismissParameters = (animated, ())
    invokedDismissParametersList.append((animated, ()))
    if shouldInvokeDismissCompletion {
      completion?()
    }
  }
}
