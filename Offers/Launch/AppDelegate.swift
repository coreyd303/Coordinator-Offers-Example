//
//  AppDelegate.swift
//  Offers
//
//  Created by Phillip Beadle on 4/5/18.
//  Copyright © 2018 Tablesand LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var appCoordinator: AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    appCoordinator = AppCoordinatorImplementation(window: window!, coordinatorFactory: AppChildCoordinatorFactoryImplementation(), presentableFactory: AppPresentableFactoryImplementation())
    appCoordinator?.start()

    return true
  }
}

