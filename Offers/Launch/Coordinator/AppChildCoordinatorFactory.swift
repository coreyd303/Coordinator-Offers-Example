//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol AppChildCoordinatorFactory: class {
  func makeOffersCoordinator(router: Router) -> OffersCoordinator
}

class AppChildCoordinatorFactoryImplementation: AppChildCoordinatorFactory {
  func makeOffersCoordinator(router: Router) -> OffersCoordinator {
    return OffersCoordinatorImplementation(router: router, presentableFactory: OffersPresentableFactoryImplementation())
  }
}
