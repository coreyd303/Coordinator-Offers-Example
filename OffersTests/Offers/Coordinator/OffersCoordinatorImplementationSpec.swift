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
      mockPresentableFactory.stubbedMakeOfferDetailPresentableResult = mockOfferDetailPresentable
      sut = OffersCoordinatorImplementation(router: mockRouter, presentableFactory: mockPresentableFactory)
    }

    afterEach {
      sut = nil
    }

    describe("a OffersCoordinatorImplementation") {
      it("should conform to OffersCoordinator") {
        expect(sut).to(beAKindOf(OffersCoordinator.self))
      }

      describe("start") {
        beforeEach {
          sut.start()
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
          context("with offer with favorableOffer") {
            beforeEach {
              mockOffersPresentable.invokedOutput?(.offer(createFavorableOffer()))
            }

            it("presentableFactory should makeOfferDetailPresentable") {
              expect(mockPresentableFactory.invokedMakeOfferDetailPresentableCount).to(equal(1))
            }

            it("offerDetailPresentable output should not be nil") {
              expect(mockOfferDetailPresentable.invokedOutput).toNot(beNil())
            }

            it("router should push") {
              expect(mockRouter.invokedPushCount).to(equal(1))
            }

            it("router should push with matching offerDetailPresentable from presentableFactory") {
              expect(mockRouter.invokedPushParameters?.presentable).to(be(mockPresentableFactory.stubbedMakeOfferDetailPresentableResult))
            }

            context("when offerDetailPresentable output runs") {
              context("with updateOffer with updatedFavorableOffer") {
                it("offersPresentable should update") {
                  mockOfferDetailPresentable.invokedOutput?(.updateOffer(createFavorableOffer()))

                  expect(mockOffersPresentable.invokedUpdateCount).to(equal(1))
                }

                it("offersPresentable should update with matching favorableOffer") {
                  let stubFavorableOffer = createFavorableOffer()

                  mockOfferDetailPresentable.invokedOutput?(.updateOffer(stubFavorableOffer))

                  expect(mockOffersPresentable.invokedUpdateParameters?.favorableOffer).to(equal(stubFavorableOffer))
                }

                context("with different offer") {
                  it("offersPresentable should update with matching favorableOffer") {
                    let stubFavorableOffer = createFavorableOffer(id: 99)

                    mockOfferDetailPresentable.invokedOutput?(.updateOffer(stubFavorableOffer))

                    expect(mockOffersPresentable.invokedUpdateParameters?.favorableOffer).to(equal(stubFavorableOffer))
                  }
                }
              }
            }
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
