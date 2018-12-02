//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

protocol OfferService {
  func getOffers(completion: (([Offer]) -> Void))
}

class OfferServiceImplementation: OfferService {
  func getOffers(completion: (([Offer]) -> Void)) {
    var offers: [Offer] = []

    if let path = Bundle.main.path(forResource: "Offers", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        offers = try JSONDecoder().decode([Offer].self, from: data)
      } catch let error {
        print(error.localizedDescription)
      }
    }

    return completion(offers)
  }
}
