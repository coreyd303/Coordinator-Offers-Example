//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOfferService: OfferService {
  var invokedGetOffers = false
  var invokedGetOffersCount = 0
  var stubbedGetOffersResult: [Offer]! = []

  func getOffers() -> [Offer] {
    invokedGetOffers = true
    invokedGetOffersCount += 1
    return stubbedGetOffersResult
  }

  var invokedGetOffer = false
  var invokedGetOfferCount = 0
  var invokedGetOfferParameters: (offerID: String, Void)?
  var invokedGetOfferParametersList = [(offerID: String, Void)]()
  var stubbedGetOfferResult: Offer!

  func getOffer(forID offerID: String) -> Offer? {
    invokedGetOffer = true
    invokedGetOfferCount += 1
    invokedGetOfferParameters = (offerID, ())
    invokedGetOfferParametersList.append((offerID, ()))
    return stubbedGetOfferResult
  }

  var invokedUpdateOffer = false
  var invokedUpdateOfferCount = 0
  var invokedUpdateOfferParameters: (offer: Offer, Void)?
  var invokedUpdateOfferParametersList = [(offer: Offer, Void)]()

  func updateOffer(_ offer: Offer) {
    invokedUpdateOffer = true
    invokedUpdateOfferCount += 1
    invokedUpdateOfferParameters = (offer, ())
    invokedUpdateOfferParametersList.append((offer, ()))
  }
}
