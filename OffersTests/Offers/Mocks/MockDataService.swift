//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

@testable import Offers

class MockDataStore: DataStore {
  var invokedElements = false
  var invokedElementsCount = 0
  var stubbedElementsResult: [Any]! = []

  func elements<T: Codable>() -> [T] {
    invokedElements = true
    invokedElementsCount += 1
    return stubbedElementsResult as! [T]
  }

  var invokedSaveElements = false
  var invokedSaveElementsCount = 0
  var invokedSaveElementsParameters: (elements: [Any], Void)?
  var invokedSaveElementsParametersList = [(elements: [Any], Void)]()

  func saveElements<T: Codable>(_ elements: [T]) {
    invokedSaveElements = true
    invokedSaveElementsCount += 1
    invokedSaveElementsParameters = (elements, ())
    invokedSaveElementsParametersList.append((elements, ()))
  }
}

