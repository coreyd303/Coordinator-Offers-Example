//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockAppChildCoordinatorFactory: AppChildCoordinatorFactory {
  var invokedMakeOffersCoordinator = false
  var invokedMakeOffersCoordinatorCount = 0
  var invokedMakeOffersCoordinatorParameters: (router: Router, Void)?
  var invokedMakeOffersCoordinatorParametersList = [(router: Router, Void)]()
  var stubbedMakeOffersCoordinatorResult: OffersCoordinator!

  func makeOffersCoordinator(router: Router) -> OffersCoordinator {
    invokedMakeOffersCoordinator = true
    invokedMakeOffersCoordinatorCount += 1
    invokedMakeOffersCoordinatorParameters = (router, ())
    invokedMakeOffersCoordinatorParametersList.append((router, ()))
    return stubbedMakeOffersCoordinatorResult
  }
}
