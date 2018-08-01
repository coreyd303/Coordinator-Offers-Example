//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockOffersPresentable: OffersPresentable {
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OffersPresentableOutput) -> ())?
  var invokedOutputList = [((OffersPresentableOutput) -> ())?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OffersPresentableOutput) -> ())!
  var output: ((OffersPresentableOutput) -> ())? {
    set {
      invokedOutputSetter = true
      invokedOutputSetterCount += 1
      invokedOutput = newValue
      invokedOutputList.append(newValue)
    }
    get {
      invokedOutputGetter = true
      invokedOutputGetterCount += 1
      return stubbedOutput
    }
  }
  var invokedUpdate = false
  var invokedUpdateCount = 0
  var invokedUpdateParameters: (favorableOffer: FavorableOffer, Void)?
  var invokedUpdateParametersList = [(favorableOffer: FavorableOffer, Void)]()

  func update(favorableOffer: FavorableOffer) {
    invokedUpdate = true
    invokedUpdateCount += 1
    invokedUpdateParameters = (favorableOffer, ())
    invokedUpdateParametersList.append((favorableOffer, ()))
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
