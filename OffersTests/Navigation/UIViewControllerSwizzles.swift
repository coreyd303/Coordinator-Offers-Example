//
// Created by Phillip Beadle on 8/2/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

extension UIViewController {
    static func swizzleMethods() {
        let originalPerformSegue = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.performSegue(withIdentifier:sender:)))
        let swizzledPerformSegue = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.fakePerformSegue(withIdentifier:sender:)))
        method_exchangeImplementations(originalPerformSegue!, swizzledPerformSegue!)

        let originalPush = class_getInstanceMethod(UINavigationController.self, #selector(UINavigationController.pushViewController(_:animated:)))
        let swizzledPush = class_getInstanceMethod(UINavigationController.self, #selector(UINavigationController.fakePushViewController(_:animated:)))
        method_exchangeImplementations(originalPush!, swizzledPush!)

        let originalPresent = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.present(_:animated:completion:)))
        let swizzledPresent = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.fakePresent(_:animated:completion:)))
        method_exchangeImplementations(originalPresent!, swizzledPresent!)

        let originalDismiss = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.dismiss(animated:completion:)))
        let swizzledDismiss = class_getInstanceMethod(UIViewController.self, #selector(UIViewController.fakeDismiss(animated:completion:)))
        method_exchangeImplementations(originalDismiss!, swizzledDismiss!)
    }

    static var invokedPerformSegueCount = 0
    static var invokedPerformSegueParameters: (identifier: String, sender: Any?)?

    @objc func fakePerformSegue(withIdentifier identifier: String, sender: Any?) {
        UIViewController.invokedPerformSegueCount += 1
        UIViewController.invokedPerformSegueParameters = (identifier, sender)
    }

    static var invokedPushCount = 0
    static var invokedPushParameters: (viewController: UIViewController, animated: Bool)?

    @objc func fakePushViewController(_ viewController: UIViewController, animated: Bool) {
        UINavigationController.invokedPushCount += 1
        UINavigationController.invokedPushParameters = (viewController, animated)
    }

    static var invokedPresentCount = 0
    static var invokedPresentParameters: (viewController: UIViewController, animated: Bool, completion: (() -> Void)?)?

    @objc func fakePresent(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        UIViewController.invokedPresentCount += 1
        UIViewController.invokedPresentParameters = (viewController, animated, completion)
    }

    static var invokedDismissCount = 0
    static var invokedDismissParameters: (animated: Bool, completion: (() -> Void)?)?

    @objc func fakeDismiss(animated: Bool, completion: (() -> Void)?) {
        UIViewController.invokedDismissCount += 1
        UIViewController.invokedDismissParameters = (animated, completion)
    }

    static func resetSwizzles() {
        invokedPerformSegueCount = 0
        invokedPerformSegueParameters = nil
        invokedPushCount = 0
        invokedPushParameters = nil
        invokedPresentCount = 0
        invokedPresentParameters = nil
        invokedDismissCount = 0
        invokedDismissParameters = nil
    }
}
