//
// Created by Phillip Beadle on 4/8/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockWindowProviding: WindowProviding {
  var invokedSetRootPresentable = false
  var invokedSetRootPresentableCount = 0
  var invokedSetRootPresentableParameters: (presentable: Presentable, Void)?
  var invokedSetRootPresentableParametersList = [(presentable: Presentable, Void)]()

  func setRootPresentable(_ presentable: Presentable) {
    invokedSetRootPresentable = true
    invokedSetRootPresentableCount += 1
    invokedSetRootPresentableParameters = (presentable, ())
    invokedSetRootPresentableParametersList.append((presentable, ()))
  }
}
