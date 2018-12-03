//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

struct OffersViewData: Equatable {
  let offers: [Offer]
}

protocol OffersViewModel: class {
  var output: ((OffersViewData) -> Void)? { get set }
  func getOffers()
  func offerID(atIndex index: Int) -> String
}

class OffersViewModelImplementation: OffersViewModel {
  var output: ((OffersViewData) -> Void)?
  let offerService: OfferService

  init(offerService: OfferService) {
    self.offerService = offerService
  }

  func getOffers() {
    outputViewData()
  }

  func offerID(atIndex index: Int) -> String {
    return offerService.getOffers()[index].id
  }

  // MARK: - Private

  private func outputViewData() {
    let offers = offerService.getOffers()
    output?(OffersViewData(offers: offers))
  }
}
