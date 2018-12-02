import Quick
import Nimble
@testable import Offers

class OffersControllerSpec: QuickSpec {
  override func spec() {
    var mockViewModel: MockOffersViewModel!
    var mockView: MockOffersView!
    var sut: OffersController!
    var invokedOutput: OffersPresentableOutput?

    beforeEach {
      mockViewModel = MockOffersViewModel()
      mockView = MockOffersView()
      sut = OffersController(viewModel: mockViewModel)
      sut.view = mockView

      sut.output = { output in
        invokedOutput = output
      }
    }

    afterEach {
      sut = nil
    }

    describe("a OffersController") {
      context("init with defaults") {
        it("view should be a OffersViewImplementation") {
          sut = OffersController(viewModel: mockViewModel)

          expect(sut.view).to(beAKindOf(OffersViewImplementation.self))
        }
      }

      describe("viewDidLoad") {
        beforeEach {
          sut.viewDidLoad()
        }

        it("title should match") {
          expect(sut.title).to(equal("Offers"))
        }

        it("view output should not be nil") {
          expect(mockView.invokedOutput).toNot(beNil())
        }

        context("when view output runs") {
          context("with offerTapped with an index") {
            it("output should run with offer with matching favorableOffer") {
              let stubFavorableOffer: FavorableOffer = createFavorableOffer()
              mockViewModel.stubbedOffers = [stubFavorableOffer]

              mockView.invokedOutput?(.offerTapped(atIndex: 0))

              expect(invokedOutput).to(equal(OffersPresentableOutput.offer(stubFavorableOffer)))
            }
          }
        }

        it("viewModel output should not be nil") {
          expect(mockViewModel.invokedOutput).toNot(beNil())
        }

        context("when viewModel output runs") {
          context("with update with viewData") {
            it("view should update with matching viewData") {
              let stubViewData = OffersViewData(favorableOffers: [createFavorableOffer()])

              mockViewModel.invokedOutput?(stubViewData)

              expect(mockView.invokedUpdateParameters?.viewData).to(equal(stubViewData))
            }
          }
        }

        it("viewModel should getOffers") {
          expect(mockViewModel.invokedGetOffersCount).to(equal(1))
        }
      }
    }

    func createFavorableOffer(id: String = "0") -> FavorableOffer {
      let stubOffer = Offer(id: id, urlString: nil, name: "", description: "", terms: "", currentValue: "")
      let stubFavorableOffer = FavorableOffer(offer: stubOffer, favored: false)
      return stubFavorableOffer
    }
  }
}
