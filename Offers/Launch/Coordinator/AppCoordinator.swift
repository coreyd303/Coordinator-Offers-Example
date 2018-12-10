//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

protocol AppCoordinator: Coordinator {
}

class AppCoordinatorImplementation: BaseCoordinator, AppCoordinator {
  let window: WindowProviding
  let coordinatorFactory: AppChildCoordinatorFactory
  let presentableFactory: AppPresentableFactory

  init(window: WindowProviding, coordinatorFactory: AppChildCoordinatorFactory, presentableFactory: AppPresentableFactory) {
    self.window = window
    self.coordinatorFactory = coordinatorFactory
    self.presentableFactory = presentableFactory
  }

  override func start(with option: DeepLinkOption?) {
    if let option = option {
      childCoordinators.forEach { coordinator in
        coordinator.start(with: option)
      }
    } else {
      startOffers()
    }
  }

  // MARK: - Private

  private func startOffers() {
    let router = presentableFactory.makeRouter()
    window.setRootPresentable(router)
    let offersCoordinator = coordinatorFactory.makeOffersCoordinator(router: router)
    addDependency(offersCoordinator)
    offersCoordinator.didFinish = { [weak self] in
      self?.removeDependency(offersCoordinator)
    }
    offersCoordinator.start()
  }
}
