//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol OffersCoordinator: Coordinator {
}

class OffersCoordinatorImplementation: OffersCoordinator {
  let router: Router
  let presentableFactory: OffersPresentableFactory
  var offersPresentable: OffersPresentable?

  init(router: Router, presentableFactory: OffersPresentableFactory) {
    self.router = router
    self.presentableFactory = presentableFactory
  }

  func start() {
    offersPresentable = presentableFactory.makeOffersPresentable()
    offersPresentable?.output = { [unowned self] offersPresentableOutput in
      switch offersPresentableOutput {
      case .offer(let favorableOffer):
        self.showOfferDetail(favorableOffer)
      }
    }
    router.setRootPresentable(offersPresentable!)
  }

  private func showOfferDetail(_ favorableOffer: FavorableOffer) {
    let offerDetailPresentable = presentableFactory.makeOfferDetailPresentable(favorableOffer: favorableOffer)
    offerDetailPresentable.output = { [offersPresentable] offerDetailViewOutput in
      switch offerDetailViewOutput {
      case .updateOffer(let updatedFavorableOffer):
        offersPresentable?.update(favorableOffer: updatedFavorableOffer)
      }
    }
    router.push(offerDetailPresentable)
  }
}
