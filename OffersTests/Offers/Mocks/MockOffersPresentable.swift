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
}
