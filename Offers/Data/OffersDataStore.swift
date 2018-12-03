//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Foundation

class OfferDataStore: DataStore {
  func elements<T: Codable>() -> [T] {
    var elements: [T] = []

    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    let fileName = String(describing: T.self)

    if let documentPath = paths.first {
      let filePath = NSMutableString(string: documentPath).appendingPathComponent(fileName)

      if !FileManager.default.fileExists(atPath: filePath) {
        loadInitialDataSet()
      }

      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .alwaysMapped)
        elements = try JSONDecoder().decode([T].self, from: data)
      } catch {
        print("could not load elements: \(error.localizedDescription)")
      }
    }

    return elements
  }

  func saveElements<T: Codable>(_ elements: [T]) {
    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    let fileName = String(describing: T.self)

    if let documentPath = paths.first {
      let filePath = NSMutableString(string: documentPath).appendingPathComponent(fileName)

      let URL = NSURL.fileURL(withPath: filePath)
      do {
        let data = try JSONEncoder().encode(elements)
        _ = try data.write(to: URL)
      } catch {
        print("could not save elements: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - Private

  private func loadInitialDataSet() {
    if let path = Bundle.main.path(forResource: "Offers", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let offers = try JSONDecoder().decode([Offer].self, from: data)
        saveElements(offers)
      } catch {
        print("could not load initial json: \(error.localizedDescription)")
      }
    }
  }
}
