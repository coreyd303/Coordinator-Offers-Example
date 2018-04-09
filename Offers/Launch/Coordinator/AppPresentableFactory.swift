//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol AppPresentableFactory: class {
  func makeRouter() -> Router
}

class AppPresentableFactoryImplementation: AppPresentableFactory {
  func makeRouter() -> Router {
    return RouterImplementation(rootController: UINavigationController())
  }
}
