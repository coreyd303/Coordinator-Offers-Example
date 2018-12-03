//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol OffersCoordinator: Coordinator {
}

class OffersCoordinatorImplementation: BaseCoordinator, OffersCoordinator {
  let router: Router
  let presentableFactory: OffersPresentableFactory
  var offersPresentable: OffersPresentable?

  init(router: Router, presentableFactory: OffersPresentableFactory) {
    self.router = router
    self.presentableFactory = presentableFactory
  }

    override func start() {
    offersPresentable = presentableFactory.makeOffersPresentable()
    offersPresentable?.output = { [unowned self] offersPresentableOutput in
      switch offersPresentableOutput {
      case let .offer(offerID):
        self.showOfferDetail(forOfferID: offerID)
      }
    }
    router.setRootPresentable(offersPresentable!)
  }

    override func start(with option: DeepLinkOption?) {
    if let option = option {
      switch option {
      case .offers:
        start()
      case let .offer(offerID):
        showOfferDetail(forOfferID: offerID)
      }
    }
  }

  // MARK: - Private

  private func showOfferDetail(forOfferID offerID: String) {
    let offerDetailPresentable = presentableFactory.makeOfferDetailsPresentable(offerID: offerID)
    router.push(offerDetailPresentable)
  }
}
