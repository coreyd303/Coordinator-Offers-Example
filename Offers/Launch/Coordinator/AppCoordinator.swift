//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol AppCoordinator: Coordinator {
}

class AppCoordinatorImplementation: AppCoordinator {
  let window: WindowProviding
  let coordinatorFactory: AppChildCoordinatorFactory
  let presentableFactory: AppPresentableFactory
  var offersCoordinator: OffersCoordinator?

  init(window: WindowProviding, coordinatorFactory: AppChildCoordinatorFactory, presentableFactory: AppPresentableFactory) {
    self.window = window
    self.coordinatorFactory = coordinatorFactory
    self.presentableFactory = presentableFactory
  }

  func start() {
    let router = presentableFactory.makeRouter()
    window.setRootPresentable(router)
    offersCoordinator = coordinatorFactory.makeOffersCoordinator(router: router)
    offersCoordinator?.start()
  }
}
