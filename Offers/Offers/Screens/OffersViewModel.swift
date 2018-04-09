//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

struct OffersViewData: Equatable {
  let favorableOffers: [FavorableOffer]
}

protocol OffersViewModel: class {
  func getOffers()
  func update(favorableOffer: FavorableOffer)
  var offers: [FavorableOffer] { get }
  var output: ((OffersViewData) -> Void)? { get set }
}

class OffersViewModelImplementation: OffersViewModel {
  private(set) var offers: [FavorableOffer] = [] {
    didSet {
      output?(OffersViewData(favorableOffers: offers))
    }
  }
  var output: ((OffersViewData) -> Void)?
  let offerService: OfferService

  init(offerService: OfferService) {
    self.offerService = offerService
  }

  func getOffers() {
    offerService.getOffers { [weak self] receivedOffers in
      self?.offers = receivedOffers.map { FavorableOffer(offer: $0, favored: false) }
    }
  }

  func update(favorableOffer: FavorableOffer) {
    if let offerIndex = offers.index(where: { $0.offer.id == favorableOffer.offer.id }) {
      offers[offerIndex] = favorableOffer
      output?(OffersViewData(favorableOffers: offers))
    }
  }
}
