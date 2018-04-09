import Quick
import Nimble
@testable import Offers

class AppChildCoordinatorFactoryImplementationSpec: QuickSpec {
  override func spec() {
    var mockRouter: MockRouter!
    var sut: AppChildCoordinatorFactoryImplementation!

    beforeEach {
      mockRouter = MockRouter()
      sut = AppChildCoordinatorFactoryImplementation()
    }

    afterEach {
      sut = nil
    }

    describe("a AppChildCoordinatorFactoryImplementation") {
      it("should conform to AppChildCoordinatorFactory") {
        expect(sut).to(beAKindOf(AppChildCoordinatorFactory.self))
      }

      describe("makeOffersCoordinator") {
        it("should return an OffersCoordinator") {
          expect(sut.makeOffersCoordinator(router: MockRouter())).to(beAKindOf(OffersCoordinator.self))
        }

        it("should return an OffersCoordinatorImplementation") {
          expect(sut.makeOffersCoordinator(router: MockRouter())).to(beAKindOf(OffersCoordinatorImplementation.self))
        }

        it("should init with matching router") {
          let offersCoordinator = sut.makeOffersCoordinator(router: mockRouter) as! OffersCoordinatorImplementation

          expect(offersCoordinator.router).to(be(mockRouter))
        }

        it("should init with matching presentableFactory") {
          let offersCoordinator = sut.makeOffersCoordinator(router: mockRouter) as! OffersCoordinatorImplementation

          expect(offersCoordinator.presentableFactory).to(beAKindOf(OffersPresentableFactoryImplementation.self))
        }
      }
    }
  }
}
