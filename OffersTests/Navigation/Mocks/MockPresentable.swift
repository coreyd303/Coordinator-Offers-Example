//
// Created by Phillip Beadle on 8/2/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers
import UIKit

class MockPresentable: Presentable {
    func toPresent() -> UIKit.UIViewController {
        return UIViewController()
    }

    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {}

    func dismiss(animated: Bool, completion: (() -> Void)?) {}
}
