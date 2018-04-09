//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOfferService: OfferService {
  var invokedGetOffers = false
  var invokedGetOffersCount = 0
  var stubbedGetOffersCompletionResult: ([Offer], Void)?

  func getOffers(completion: (([Offer]) -> Void)) {
    invokedGetOffers = true
    invokedGetOffersCount += 1
    if let result = stubbedGetOffersCompletionResult {
      _ = completion(result.0)
    }
  }
}
