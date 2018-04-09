//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockAppPresentableFactory: AppPresentableFactory {
  var invokedMakeRouter = false
  var invokedMakeRouterCount = 0
  var stubbedMakeRouterResult: Router!

  func makeRouter() -> Router {
    invokedMakeRouter = true
    invokedMakeRouterCount += 1
    return stubbedMakeRouterResult
  }
}
