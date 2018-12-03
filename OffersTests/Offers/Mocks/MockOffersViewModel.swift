//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOffersViewModel: OffersViewModel {
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
  var invokedUpdateParameters: (offer: Offer, Void)?
  var invokedUpdateParametersList = [(offer: Offer, Void)]()

  func update(offer: Offer) {
    invokedUpdate = true
    invokedUpdateCount += 1
    invokedUpdateParameters = (offer, ())
    invokedUpdateParametersList.append((offer, ()))
  }

  var invokedOfferID = false
  var invokedOfferIDCount = 0
  var invokedOfferIDParameters: (index: Int, Void)?
  var invokedOfferIDParametersList = [(index: Int, Void)]()
  var stubbedOfferIDResult: String! = ""

  func offerID(atIndex index: Int) -> String {
    invokedOfferID = true
    invokedOfferIDCount += 1
    invokedOfferIDParameters = (index, ())
    invokedOfferIDParametersList.append((index, ()))
    return stubbedOfferIDResult
  }
}
