//
// Created by Phillip Beadle on 8/1/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol Presenter {
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: Presenter {
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {
        present(presentable.toPresent(), animated: animated, completion: completion)
    }
}
