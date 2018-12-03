//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockCoordinator: Coordinator {
  var invokedStart = false
  var invokedStartCount = 0

  func start() {
    invokedStart = true
    invokedStartCount += 1
  }

  var invokedStartWith = false
  var invokedStartWithCount = 0
  var invokedStartWithParameters: (option: DeepLinkOption?, Void)?
  var invokedStartWithParametersList = [(option: DeepLinkOption?, Void)]()

  func start(with option: DeepLinkOption?) {
    invokedStartWith = true
    invokedStartWithCount += 1
    invokedStartWithParameters = (option, ())
    invokedStartWithParametersList.append((option, ()))
  }
}

