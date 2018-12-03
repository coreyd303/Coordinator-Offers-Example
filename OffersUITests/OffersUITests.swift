//
//  OffersUITests.swift
//  OffersUITests
//
//  Created by Phillip Beadle on 4/5/18.
//  Copyright © 2018 Tablesand LLC. All rights reserved.
//

import XCTest

class OffersUITests: XCTestCase {
  var app: XCUIApplication {
    return XCUIApplication()
  }

  override func setUp() {
    super.setUp()

    continueAfterFailure = false
    app.launch()
  }

  override func tearDown() {
    super.tearDown()
  }

  func test_changing_offer_favorite_status() {
    // Because local data may have been set from previous runs, just expect the favorited state to be toggled from whatever it was
    if app.collectionViews.cells.firstMatch.images["Heart"].exists {
      app.collectionViews.cells.firstMatch.tap()
      app.tables.buttons["Heart"].tap()
      app.navigationBars["Offer Detail"].buttons["Offers"].tap()
      XCTAssertTrue(app.collectionViews.cells.firstMatch.images["HeartSelected"].exists)
    } else {
      app.collectionViews.cells.firstMatch.tap()
      app.tables.buttons["Heart"].tap()
      app.navigationBars["Offer Detail"].buttons["Offers"].tap()
      XCTAssertTrue(app.collectionViews.cells.firstMatch.images["Heart"].exists)
    }
  }
}
