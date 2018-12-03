//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOfferDetailViewModel: OfferDetailViewModel {
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OfferDetailViewData) -> Void)?
  var invokedOutputList = [((OfferDetailViewData) -> Void)?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OfferDetailViewData) -> Void)!
  var output: ((OfferDetailViewData) -> Void)? {
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
  var invokedToggleFavored = false
  var invokedToggleFavoredCount = 0

  func toggleFavored() {
    invokedToggleFavored = true
    invokedToggleFavoredCount += 1
  }
}
