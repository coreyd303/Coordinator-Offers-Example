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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    appCoordinator = AppCoordinatorImplementation(window: window!, coordinatorFactory: AppChildCoordinatorFactoryImplementation(), presentableFactory: AppPresentableFactoryImplementation())
    appCoordinator?.start()

    return true
  }

  //MARK: Handle push notifications and deep links
  func application(_ application: UIApplication,
                   didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    let dict = userInfo as? [String: AnyObject]
    let deepLink = DeepLinkOption.build(with: dict)
    appCoordinator?.start(with: deepLink)
  }

  func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                   restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    let deepLink = DeepLinkOption.build(with: userActivity)
    appCoordinator?.start(with: deepLink)
    return true
  }
}

