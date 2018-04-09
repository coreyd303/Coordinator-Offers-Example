//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOffersCoordinator: OffersCoordinator {
  var invokedStart = false
  var invokedStartCount = 0

  func start() {
    invokedStart = true
    invokedStartCount += 1
  }
}
