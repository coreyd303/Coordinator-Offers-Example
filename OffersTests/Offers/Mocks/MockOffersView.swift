//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockOffersView: UIView, OffersView {
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OffersViewOutput) -> Void)?
  var invokedOutputList = [((OffersViewOutput) -> Void)?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OffersViewOutput) -> Void)!
  var output: ((OffersViewOutput) -> Void)? {
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
  var invokedUpdateParameters: (viewData: OffersViewData, Void)?
  var invokedUpdateParametersList = [(viewData: OffersViewData, Void)]()

  func update(viewData: OffersViewData) {
    invokedUpdate = true
    invokedUpdateCount += 1
    invokedUpdateParameters = (viewData, ())
    invokedUpdateParametersList.append((viewData, ()))
  }
}
