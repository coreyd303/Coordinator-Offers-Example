//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockOffersCoordinator: OffersCoordinator {
  var invokedDidFinishSetter = false
  var invokedDidFinishSetterCount = 0
  var invokedDidFinish: (() -> Void)?
  var invokedDidFinishList = [(() -> Void)?]()
  var invokedDidFinishGetter = false
  var invokedDidFinishGetterCount = 0
  var stubbedDidFinish: (() -> Void)!
  var didFinish: (() -> Void)? {
    set {
      invokedDidFinishSetter = true
      invokedDidFinishSetterCount += 1
      invokedDidFinish = newValue
      invokedDidFinishList.append(newValue)
    }
    get {
      invokedDidFinishGetter = true
      invokedDidFinishGetterCount += 1
      return stubbedDidFinish
    }
  }
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
