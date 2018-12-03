//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

protocol OfferService {
  func getOffers() -> [Offer]
  func getOffer(forID offerID: String) -> Offer?
  func updateOffer(_ offer: Offer)
}

class OfferServiceImplementation: OfferService {
  let dataStore: DataStore

  init(dataStore: DataStore) {
    self.dataStore = dataStore
  }

  func getOffers() -> [Offer] {
    return dataStore.elements()
  }

  func getOffer(forID offerID: String) -> Offer? {
    return (getOffers().filter { $0.id == offerID }).first
  }

  func updateOffer(_ offer: Offer) {
    var offers = getOffers()
    
    for (index, offerOnDisk) in offers.enumerated() {
      if offerOnDisk.id == offer.id {
        offers[index] = offer
        dataStore.saveElements(offers)
        break
      }
    }
  }
}
