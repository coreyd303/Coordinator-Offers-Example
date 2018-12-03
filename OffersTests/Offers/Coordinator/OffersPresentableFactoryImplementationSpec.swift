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
          expect(sut.makeOfferDetailsPresentable(offerID: "")).to(beAKindOf(OfferDetailPresentable.self))
        }

        it("should return OfferDetailController") {
          expect(sut.makeOfferDetailsPresentable(offerID: "")).to(beAKindOf(OfferDetailController.self))
        }

        it("viewModel should be a OfferDetailViewModelImplementation") {
          expect((sut.makeOfferDetailsPresentable(offerID: "") as! OfferDetailController).viewModel).to(beAKindOf(OfferDetailViewModelImplementation.self))
        }

        it("viewModel offerID should match") {
          let controller = sut.makeOfferDetailsPresentable(offerID: "3") as! OfferDetailController
          let viewModel = controller.viewModel as! OfferDetailViewModelImplementation
          expect(viewModel.offerID).to(equal("3"))
        }

        context("with a different offerID") {
          it("viewModel favorableOffer should match") {
            let controller = sut.makeOfferDetailsPresentable(offerID: "99") as! OfferDetailController
            let viewModel = controller.viewModel as! OfferDetailViewModelImplementation
            expect(viewModel.offerID).to(equal("99"))
          }
        }
      }
    }
  }
}
