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

  var invokedMakeOfferDetailPresentable = false
  var invokedMakeOfferDetailPresentableCount = 0
  var invokedMakeOfferDetailPresentableParameters: (favorableOffer: FavorableOffer, Void)?
  var invokedMakeOfferDetailPresentableParametersList = [(favorableOffer: FavorableOffer, Void)]()
  var stubbedMakeOfferDetailPresentableResult: OfferDetailPresentable!

  func makeOfferDetailPresentable(favorableOffer: FavorableOffer) -> OfferDetailPresentable {
    invokedMakeOfferDetailPresentable = true
    invokedMakeOfferDetailPresentableCount += 1
    invokedMakeOfferDetailPresentableParameters = (favorableOffer, ())
    invokedMakeOfferDetailPresentableParametersList.append((favorableOffer, ()))
    return stubbedMakeOfferDetailPresentableResult
  }
}
