//
// Created by Phillip Beadle on 2018-12-01.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

struct DeepLinkKey {
  static let offers = "offers"
  static let offer = "offer"
}

enum DeepLinkOption: Equatable {
  case offers
  case offer(String)

  static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
    var deepLink: DeepLinkOption?

    if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
       let url = userActivity.webpageURL {
      let id = url.deepLinkOptionID
      switch id {
      case DeepLinkKey.offers:
        deepLink = .offers
      case DeepLinkKey.offer:
        if let offerID = url.deepLinkOfferID {
          deepLink = .offer(offerID)
        }
      default: return nil
      }
    }

    return deepLink
  }

  static func build(with dict: [String: AnyObject]?) -> DeepLinkOption? {
    guard let id = dict?["launch_id"] as? String else { return nil }

    switch id {
    case DeepLinkKey.offers:
      return .offers
    case DeepLinkKey.offer:
      if let offerID = dict?["offer_id"] as? String {
        return .offer(offerID)
      } else {
        return nil
      }
    default: return nil
    }
  }
}

extension URL {
  var deepLinkOptionID: String? {
    var launchID: String?
    if let components = URLComponents(url: self, resolvingAgainstBaseURL: true) {

      if let queryItems = components.queryItems, let launchIDQueryItem = (queryItems.filter { $0.name == "launch_id" }).first {
        launchID = launchIDQueryItem.value
      }
    }

    return launchID
  }

  var deepLinkOfferID: String? {
    var offerID: String?
    if let components = URLComponents(url: self, resolvingAgainstBaseURL: true) {

      if let queryItems = components.queryItems, let offerIDQueryItem = (queryItems.filter { $0.name == "offer_id" }).first {
        offerID = offerIDQueryItem.value
      }
    }

    return offerID
  }
}
