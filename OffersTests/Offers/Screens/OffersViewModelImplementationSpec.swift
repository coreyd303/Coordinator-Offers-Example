import Quick
import Nimble
@testable import Offers

class OffersViewModelImplementationSpec: QuickSpec {
  override func spec() {
    var mockOfferService: MockOfferService!
    var sut: OffersViewModelImplementation!

    beforeEach {
      mockOfferService = MockOfferService()
      sut = OffersViewModelImplementation(offerService: mockOfferService)
    }

    afterEach {
      sut = nil
    }

    describe("a OffersViewModelImplementation") {
      describe("getOffers") {
        it("offerService should getOffers") {
          sut.getOffers()

          expect(mockOfferService.invokedGetOffersCount).to(equal(1))
        }

        it("should output with matching offers from service") {
          let stubOffer = createOffer()
          mockOfferService.stubbedGetOffersResult = [stubOffer]
          var invokedOffersViewData: OffersViewData?
          sut.output = { viewData in
            invokedOffersViewData = viewData
          }

          sut.getOffers()

          expect(invokedOffersViewData).to(equal(OffersViewData(offers: [stubOffer])))
        }
      }

      describe("offerID") {
        beforeEach {
          let stubOffer = createOffer(id: "3")
          mockOfferService.stubbedGetOffersResult = [stubOffer]
        }

        it("offerService should getOffers") {
          _ = sut.offerID(atIndex: 0)

          expect(mockOfferService.invokedGetOffersCount).to(equal(1))
        }

        it("should return offer id of offerService getOffers at matching index") {

          let id = sut.offerID(atIndex: 0)

          expect(id).to(equal("3"))
        }
      }
    }

    func createOffer(id: String = "0", name: String = "") -> Offer {
      let stubOffer = Offer(id: id, urlString: nil, name: name, description: "", terms: "", currentValue: "", favored: false)
      return stubOffer
    }
  }
}
