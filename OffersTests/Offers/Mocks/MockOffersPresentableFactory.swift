//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOffersPresentableFactory: OffersPresentableFactory {
  var invokedMakeOffersPresentable = false
  var invokedMakeOffersPresentableCount = 0
  var stubbedMakeOffersPresentableResult: OffersPresentable!

  func makeOffersPresentable() -> OffersPresentable {
    invokedMakeOffersPresentable = true
    invokedMakeOffersPresentableCount += 1
    return stubbedMakeOffersPresentableResult
  }

  var invokedMakeOfferDetailsPresentable = false
  var invokedMakeOfferDetailsPresentableCount = 0
  var invokedMakeOfferDetailsPresentableParameters: (offerID: String, Void)?
  var invokedMakeOfferDetailsPresentableParametersList = [(offerID: String, Void)]()
  var stubbedMakeOfferDetailsPresentableResult: OfferDetailPresentable!

  func makeOfferDetailsPresentable(offerID: String) -> OfferDetailPresentable {
    invokedMakeOfferDetailsPresentable = true
    invokedMakeOfferDetailsPresentableCount += 1
    invokedMakeOfferDetailsPresentableParameters = (offerID, ())
    invokedMakeOfferDetailsPresentableParametersList.append((offerID, ()))
    return stubbedMakeOfferDetailsPresentableResult
  }
}
