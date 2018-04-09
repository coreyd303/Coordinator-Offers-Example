//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import SwiftyJSON

protocol OfferService {
  func getOffers(completion: (([Offer]) -> Void))
}

class OfferServiceImplementation: OfferService {
  func getOffers(completion: (([Offer]) -> Void)) {
    var offers = [Offer]()

    if let path = Bundle.main.path(forResource: "Offers", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let jsonArray = try JSON(data: data).arrayValue

        for json in jsonArray {
          do {
            offers.append(try Offer(json: json))
          } catch let jsonError {
            print(jsonError.localizedDescription)
          }
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }

    return completion(offers)
  }
}
