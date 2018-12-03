import Quick
import Nimble
@testable import Offers

class OffersCoordinatorImplementationSpec: QuickSpec {
  override func spec() {
    var mockRouter: MockRouter!
    var mockPresentableFactory: MockOffersPresentableFactory!
    var mockOffersPresentable: MockOffersPresentable!
    var mockOfferDetailPresentable: MockOfferDetailPresentable!
    var sut: OffersCoordinatorImplementation!

    beforeEach {
      mockRouter = MockRouter()
      mockPresentableFactory = MockOffersPresentableFactory()
      mockOffersPresentable = MockOffersPresentable()
      mockOfferDetailPresentable = MockOfferDetailPresentable()
      mockPresentableFactory.stubbedMakeOffersPresentableResult = mockOffersPresentable
      mockPresentableFactory.stubbedMakeOfferDetailsPresentableResult = mockOfferDetailPresentable
      sut = OffersCoordinatorImplementation(router: mockRouter, presentableFactory: mockPresentableFactory)
    }

    afterEach {
      sut = nil
    }

    describe("a OffersCoordinatorImplementation") {
      it("should conform to OffersCoordinator") {
        expect(sut).to(beAKindOf(OffersCoordinator.self))
      }

      describe("start with option") {
        context("with offers option") {
          it("router should setRootPresentable with matching offersPresentable from presentableFactory") {
            sut.start(with: .offers)

            expect(mockRouter.invokedSetRootPresentableParameters?.presentable).to(be(mockPresentableFactory.stubbedMakeOffersPresentableResult))
          }
        }

        context("with offer option") {
          beforeEach {
            sut.start(with: .offer("0"))
          }

          it("presentableFactory should makeOfferDetailPresentable") {
            expect(mockPresentableFactory.invokedMakeOfferDetailsPresentableCount).to(equal(1))
          }

          it("router should push") {
            expect(mockRouter.invokedPushCount).to(equal(1))
          }

          it("router should push with matching offerDetailPresentable from presentableFactory") {
            expect(mockRouter.invokedPushParameters?.presentable).to(be(mockPresentableFactory.stubbedMakeOfferDetailsPresentableResult))
          }
        }

        context("with no option") {
          beforeEach {
            sut.start(with: nil)
          }

          it("presentableFactory should makeOffersPresentable") {
            expect(mockPresentableFactory.invokedMakeOffersPresentableCount).to(equal(1))
          }

          it("should set offersPresentable to presentableFactory.makeOffersPresentable output") {
            expect(sut.offersPresentable).to(be(mockPresentableFactory.stubbedMakeOffersPresentableResult))
          }

          it("offersPresentable output should not be nil") {
            expect(mockOffersPresentable.invokedOutput).toNot(beNil())
          }

          it("router should setRootPresentable") {
            expect(mockRouter.invokedSetRootPresentableCount).to(equal(1))
          }

          it("router should setRootPresentable with matching offersPresentable from presentableFactory") {
            expect(mockRouter.invokedSetRootPresentableParameters?.presentable).to(be(mockPresentableFactory.stubbedMakeOffersPresentableResult))
          }

          context("when offersPresentable output runs") {
            context("with offer") {
              beforeEach {
                mockOffersPresentable.invokedOutput?(.offer(offerID: "0"))
              }

              it("presentableFactory should makeOfferDetailPresentable") {
                expect(mockPresentableFactory.invokedMakeOfferDetailsPresentableCount).to(equal(1))
              }

              it("router should push") {
                expect(mockRouter.invokedPushCount).to(equal(1))
              }

              it("router should push with matching offerDetailPresentable from presentableFactory") {
                expect(mockRouter.invokedPushParameters?.presentable).to(be(mockPresentableFactory.stubbedMakeOfferDetailsPresentableResult))
              }
            }
          }
        }
      }
    }

    func createOffer(id: String = "0") -> Offer {
      let stubOffer = Offer(id: id, urlString: nil, name: "", description: "", terms: "", currentValue: "", favored: false)
      return stubOffer
    }
  }
}
