//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

protocol OfferDetailViewModel: class {
  var favorableOffer: FavorableOffer { get set }
  var output: ((OfferDetailViewData) -> Void)? { get set }
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
  var favorableOffer: FavorableOffer {
    didSet {
      outputViewData()
    }
  }

  init(favorableOffer: FavorableOffer) {
    self.favorableOffer = favorableOffer
  }

  private func outputViewData() {
    let viewData = OfferDetailViewData(data: [
      OfferDetailViewData.Data(title: "Name", detail: String(favorableOffer.offer.name)),
      OfferDetailViewData.Data(title: "Description", detail: String(favorableOffer.offer.description)),
      OfferDetailViewData.Data(title: "Terms", detail: String(favorableOffer.offer.terms)),
      OfferDetailViewData.Data(title: "Current Value", detail: String(favorableOffer.offer.currentValue))
    ], url: favorableOffer.offer.url, favorite: favorableOffer.favored)
    output?(viewData)
  }
}
