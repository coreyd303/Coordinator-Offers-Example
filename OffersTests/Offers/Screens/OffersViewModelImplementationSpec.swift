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

        context("when offerService returns offers") {
          it("offers should match") {
            let stubOffer = createOffer()
            mockOfferService.stubbedGetOffersCompletionResult = ([stubOffer], ())

            sut.getOffers()

            expect(sut.offers).to(equal([FavorableOffer(offer: stubOffer, favored: false)]))
          }
        }
      }

      describe("update") {
        context("with existing offer id") {
          it("offers should replace matching index with updated offer") {
            let stubOffer = createOffer(id: 99)
            mockOfferService.stubbedGetOffersCompletionResult = ([stubOffer], ())
            sut.getOffers()

            let newStubOffer = createOffer(id: 99, name: "test")
            let stubFavorableOffer = FavorableOffer(offer: newStubOffer, favored: false)
            sut.update(favorableOffer: stubFavorableOffer)

            expect(sut.offers.first).to(equal(stubFavorableOffer))
          }
        }

        context("with non-matching id offer") {
          it("offers should not change") {
            let oldStubOffer = createOffer(id: 99)
            let oldStubFavorableOffer = FavorableOffer(offer: oldStubOffer, favored: false)
            mockOfferService.stubbedGetOffersCompletionResult = ([oldStubOffer], ())
            sut.getOffers()

            let updatedStubOffer = createOffer(id: 22, name: "test")
            let updatedStubFavorableOffer = FavorableOffer(offer: updatedStubOffer, favored: false)
            sut.update(favorableOffer: updatedStubFavorableOffer)

            expect(sut.offers.first).to(equal(oldStubFavorableOffer))
          }
        }

        it("should output matching updated offersViewData") {
          let stubOffer = createOffer(id: 99)
          mockOfferService.stubbedGetOffersCompletionResult = ([stubOffer], ())
          sut.getOffers()
          var invokedOffersViewData: OffersViewData?
          sut.output = { viewData in
            invokedOffersViewData = viewData
          }

          let newStubOffer = createOffer(id: 99, name: "test")
          let stubFavorableOffer = FavorableOffer(offer: newStubOffer, favored: false)
          sut.update(favorableOffer: stubFavorableOffer)

          expect(invokedOffersViewData).to(equal(OffersViewData(favorableOffers: [stubFavorableOffer])))
        }
      }
    }

    func createOffer(id: Int = 0, name: String = "") -> Offer {
      let stubOffer = Offer(id: id, url: nil, name: name, description: "", terms: "", currentValue: "")
      return stubOffer
    }
  }
}
