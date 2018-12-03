//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OffersPresentableFactory {
  func makeOffersPresentable() -> OffersPresentable
  func makeOfferDetailsPresentable(offerID: String) -> OfferDetailPresentable
}

class OffersPresentableFactoryImplementation: OffersPresentableFactory {    
  func makeOffersPresentable() -> OffersPresentable {
    let offerService = OfferServiceImplementation(dataStore: OfferDataStore())
    let offersViewModel = OffersViewModelImplementation(offerService: offerService)
    return OffersController(viewModel: offersViewModel)
  }

  func makeOfferDetailsPresentable(offerID: String) -> OfferDetailPresentable {
    let offerDetailViewModel = OfferDetailViewModelImplementation(offerID: offerID, offerService: OfferServiceImplementation(dataStore: OfferDataStore()))
    return OfferDetailController(viewModel: offerDetailViewModel)
  }
}
