//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OffersPresentableFactory {
  func makeOffersPresentable() -> OffersPresentable
  func makeOfferDetailPresentable(favorableOffer: FavorableOffer) -> OfferDetailPresentable
}

class OffersPresentableFactoryImplementation: OffersPresentableFactory {    
  func makeOffersPresentable() -> OffersPresentable {
    let offerService = OfferServiceImplementation()
    let offersViewModel = OffersViewModelImplementation(offerService: offerService)
    return OffersController(viewModel: offersViewModel)
  }

  func makeOfferDetailPresentable(favorableOffer: FavorableOffer) -> OfferDetailPresentable {
    let offerDetailViewModel = OfferDetailViewModelImplementation(favorableOffer: favorableOffer)
    return OfferDetailController(viewModel: offerDetailViewModel)
  }
}
