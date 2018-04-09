//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockOfferDetailPresentable: OfferDetailPresentable {
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OfferDetailPresentableOutput) -> Void)?
  var invokedOutputList = [((OfferDetailPresentableOutput) -> Void)?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OfferDetailPresentableOutput) -> Void)!
  var output: ((OfferDetailPresentableOutput) -> Void)? {
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
  var invokedToPresent = false
  var invokedToPresentCount = 0
  var stubbedToPresentResult: UIViewController!

  func toPresent() -> UIViewController {
    invokedToPresent = true
    invokedToPresentCount += 1
    return stubbedToPresentResult
  }
}
