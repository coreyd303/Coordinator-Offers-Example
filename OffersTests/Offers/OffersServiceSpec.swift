//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Quick
import Nimble
@testable import Offers

class OfferServiceImplementationSpec: QuickSpec {
  override func spec() {
    var mockDataStore: MockDataStore!
    var sut: OfferServiceImplementation!

    beforeEach {
      mockDataStore = MockDataStore()
      sut = OfferServiceImplementation(dataStore: mockDataStore)
    }

    afterEach {
      sut = nil
    }

    describe("a OfferServiceImplementation") {
      describe("getOffers") {
        it("dataStore should run elements") {
          _ = sut.getOffers()

          expect(mockDataStore.invokedElementsCount).to(equal(1))
        }
      }

      describe("getOffer") {
        it("dataStore should run elements") {
          _ = sut.getOffer(forID: "")

          expect(mockDataStore.invokedElementsCount).to(equal(1))
        }

        it("should return matching offer from elements with matching offer id") {
          let stubOffer = createOffer(id: "1")
          mockDataStore.stubbedElementsResult = [stubOffer]

          let offer = sut.getOffer(forID: "1")

          expect(offer?.id).to(equal("1"))
        }
        context("when element has no matching offer id") {
          it("should return nil") {
            let stubOffer = createOffer(id: "1")
            mockDataStore.stubbedElementsResult = [stubOffer]

            let offer = sut.getOffer(forID: "99")

            expect(offer).to(beNil())
          }
        }
      }

      describe("updateOffer") {
        it("dataStore should run elements") {
          _ = sut.getOffer(forID: "")

          expect(mockDataStore.invokedElementsCount).to(equal(1))
        }

        context("when offer id matches an existing offer") {
          let expectedOffer: Offer = createOffer(id: "1", name: "new name")

          beforeEach {
            let stubOffer = createOffer(id: "1")
            mockDataStore.stubbedElementsResult = [stubOffer]

            sut.updateOffer(expectedOffer)
          }

          it("dataStore should saveElements") {
            expect(mockDataStore.invokedSaveElementsCount).to(equal(1))
          }

          it("dataStore should saveElements with updated offer") {
            expect((mockDataStore.invokedSaveElementsParameters?.elements as? [Offer])?.contains(expectedOffer)).to(beTrue())
          }
        }
      }
    }

    func createOffer(id: String = "0", name: String = "test") -> Offer {
      return Offer(id: id, urlString: nil, name: "", description: "", terms: "", currentValue: "", favored: false)
    }
  }
}

