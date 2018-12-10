//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol OffersCoordinator: Coordinator {
  var didFinish: (() -> Void)? { get set }
}

class OffersCoordinatorImplementation: BaseCoordinator, OffersCoordinator {
  let router: Router
  let presentableFactory: OffersPresentableFactory
  var didFinish: (() -> Void)?
  var offersPresentable: OffersPresentable?

  init(router: Router, presentableFactory: OffersPresentableFactory) {
    self.router = router
    self.presentableFactory = presentableFactory
  }

  override func start(with option: DeepLinkOption?) {
    if let option = option {
      switch option {
      case .offers:
        showOffers()
      case let .offer(offerID):
        showOfferDetail(forOfferID: offerID)
      }
    } else {
      showOffers()
    }
  }

  // MARK: - Private

  private func showOffers() {
    offersPresentable = presentableFactory.makeOffersPresentable()
    offersPresentable?.output = { [unowned self] offersPresentableOutput in
      switch offersPresentableOutput {
      case let .offer(offerID):
        self.showOfferDetail(forOfferID: offerID)
      }
    }
    offersPresentable?.finish = { [weak self] in
      self?.didFinish?()
    }
    router.setRootPresentable(offersPresentable!)
  }

  private func showOfferDetail(forOfferID offerID: String) {
    let offerDetailPresentable = presentableFactory.makeOfferDetailsPresentable(offerID: offerID)
    router.push(offerDetailPresentable)
  }
}
