import Quick
import Nimble
@testable import Offers

class OffersPresentableFactoryImplementationSpec: QuickSpec {
  override func spec() {
    var sut: OffersPresentableFactoryImplementation!

    beforeEach {
      sut = OffersPresentableFactoryImplementation()
    }

    afterEach {
      sut = nil
    }

    describe("a OffersPresentableFactoryImplementation") {
      it("should conform to OffersPresentableFactory") {
        expect(sut).to(beAKindOf(OffersPresentableFactory.self))
      }

      describe("makeOffersPresentable") {
        it("should return OffersPresentable") {
          expect(sut.makeOffersPresentable()).to(beAKindOf(OffersPresentable.self))
        }

        it("should return OffersController") {
          expect(sut.makeOffersPresentable()).to(beAKindOf(OffersController.self))
        }

        it("viewModel should be a OffersViewModelImplementation") {
          expect((sut.makeOffersPresentable() as! OffersController).viewModel).to(beAKindOf(OffersViewModelImplementation.self))
        }

        it("viewModel offerService should be a OfferServiceImplementation") {
          let controller = sut.makeOffersPresentable() as! OffersController
          let viewModel = controller.viewModel as! OffersViewModelImplementation
          expect(viewModel.offerService).to(beAKindOf(OfferServiceImplementation.self))
        }
      }

      describe("makeOfferDetailPresentable") {
        it("should return OfferDetailPresentable") {
          expect(sut.makeOfferDetailPresentable(favorableOffer: createFavorableOffer())).to(beAKindOf(OfferDetailPresentable.self))
        }

        it("should return OfferDetailController") {
          expect(sut.makeOfferDetailPresentable(favorableOffer: createFavorableOffer())).to(beAKindOf(OfferDetailController.self))
        }

        it("viewModel should be a OfferDetailViewModelImplementation") {
          expect((sut.makeOfferDetailPresentable(favorableOffer: createFavorableOffer()) as! OfferDetailController).viewModel).to(beAKindOf(OfferDetailViewModelImplementation.self))
        }

        it("viewModel favorableOffer should match") {
          let controller = sut.makeOfferDetailPresentable(favorableOffer: createFavorableOffer()) as! OfferDetailController
          let viewModel = controller.viewModel as! OfferDetailViewModelImplementation
          expect(viewModel.favorableOffer).to(equal(createFavorableOffer()))
        }

        context("with a different favorable offer") {
          it("viewModel favorableOffer should match") {
            let stubFavorableOffer: FavorableOffer = createFavorableOffer(id: 99)
            let controller = sut.makeOfferDetailPresentable(favorableOffer: stubFavorableOffer) as! OfferDetailController
            let viewModel = controller.viewModel as! OfferDetailViewModelImplementation
            expect(viewModel.favorableOffer).to(equal(stubFavorableOffer))
          }
        }
      }
    }

    func createFavorableOffer(id: Int = 0) -> FavorableOffer {
      let stubOffer = Offer(id: id, url: nil, name: "", description: "", terms: "", currentValue: "")
      let stubFavorableOffer = FavorableOffer(offer: stubOffer, favored: false)
      return stubFavorableOffer
    }
  }
}
