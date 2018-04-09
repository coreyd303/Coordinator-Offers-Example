//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockOfferDetailView: UIView, OfferDetailView {
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OfferDetailViewOutput) -> Void)?
  var invokedOutputList = [((OfferDetailViewOutput) -> Void)?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OfferDetailViewOutput) -> Void)!
  var output: ((OfferDetailViewOutput) -> Void)? {
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
  var invokedUpdateParameters: (withViewData: OfferDetailViewData, Void)?
  var invokedUpdateParametersList = [(withViewData: OfferDetailViewData, Void)]()

  func update(withViewData: OfferDetailViewData) {
    invokedUpdate = true
    invokedUpdateCount += 1
    invokedUpdateParameters = (withViewData, ())
    invokedUpdateParametersList.append((withViewData, ()))
  }
}
