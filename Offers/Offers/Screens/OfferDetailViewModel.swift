//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

protocol OfferDetailViewModel: class {
  var output: ((OfferDetailViewData) -> Void)? { get set }
  func toggleFavored()
}

struct OfferDetailViewData: Equatable {
  struct Data: Equatable {
    let title: String
    let detail: String
  }

  let data: [Data]
  let url: URL?
  let favorite: Bool
}

class OfferDetailViewModelImplementation: OfferDetailViewModel {
  var output: ((OfferDetailViewData) -> Void)? {
    didSet {
      outputViewData()
    }
  }
  let offerID: String
  let offerService: OfferService

  init(offerID: String, offerService: OfferService) {
    self.offerID = offerID
    self.offerService = offerService
  }

  func toggleFavored() {
    if let offer = offerService.getOffer(forID: offerID) {
      let updatedOffer = Offer(id: offer.id, urlString: offer.urlString, name: offer.name, description: offer.description, terms: offer.terms, currentValue: offer.currentValue, favored: !offer.favored)
      offerService.updateOffer(updatedOffer)
      outputViewData()
    }
  }

  // MARK: - Private

  private func outputViewData() {
    guard let offer = offerService.getOffer(forID: offerID) else {
      return
    }
    let viewData = OfferDetailViewData(data: [
      OfferDetailViewData.Data(title: "Name", detail: String(offer.name)),
      OfferDetailViewData.Data(title: "Description", detail: String(offer.description)),
      OfferDetailViewData.Data(title: "Terms", detail: String(offer.terms)),
      OfferDetailViewData.Data(title: "Current Value", detail: String(offer.currentValue))
    ], url: offer.url, favorite: offer.favored)
    output?(viewData)
  }
}
