//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOffersViewModel: OffersViewModel {
  var invokedOffersGetter = false
  var invokedOffersGetterCount = 0
  var stubbedOffers: [FavorableOffer]! = []
  var offers: [FavorableOffer] {
    invokedOffersGetter = true
    invokedOffersGetterCount += 1
    return stubbedOffers
  }
  var invokedOutputSetter = false
  var invokedOutputSetterCount = 0
  var invokedOutput: ((OffersViewData) -> Void)?
  var invokedOutputList = [((OffersViewData) -> Void)?]()
  var invokedOutputGetter = false
  var invokedOutputGetterCount = 0
  var stubbedOutput: ((OffersViewData) -> Void)!
  var output: ((OffersViewData) -> Void)? {
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
  var invokedGetOffers = false
  var invokedGetOffersCount = 0

  func getOffers() {
    invokedGetOffers = true
    invokedGetOffersCount += 1
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
}
