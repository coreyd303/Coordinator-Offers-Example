import Quick
import Nimble
@testable import Offers

class OfferDetailControllerSpec: QuickSpec {
  override func spec() {
    var mockViewModel: MockOfferDetailViewModel!
    var sut: OfferDetailController!
    var mockView: MockOfferDetailView!

    beforeEach {
      mockViewModel = MockOfferDetailViewModel()
      sut = OfferDetailController(viewModel: mockViewModel)
      mockView = MockOfferDetailView()
      sut.view = mockView
    }

    afterEach {
      sut = nil
    }

    describe("a OfferDetailController") {
      context("init with defaults") {
        it("view should be a OfferDetailViewImplementation") {
          sut = OfferDetailController(viewModel: mockViewModel)

          expect(sut.view).to(beAKindOf(OfferDetailViewImplementation.self))
        }
      }

      describe("viewDidLoad") {
        beforeEach {
          sut.viewDidLoad()
        }

        it("title should match") {
          expect(sut.title).to(equal("Offer Detail"))
        }

        it("viewModel output should not be nil") {
          expect(mockViewModel.invokedOutput).toNot(beNil())
        }

        context("when viewModel output runs with viewData") {
          it("view should run update with matching viewData") {
            let stubViewData: OfferDetailViewData = OfferDetailViewData(data: [], url: nil, favorite: false)
            mockViewModel.invokedOutput?(stubViewData)

            expect(mockView.invokedUpdateCount).to(equal(1))
          }

          it("view should run update with matching viewData") {
            let stubViewData: OfferDetailViewData = OfferDetailViewData(data: [], url: nil, favorite: false)
            mockViewModel.invokedOutput?(stubViewData)

            expect(mockView.invokedUpdateParameters?.withViewData).to(equal(stubViewData))
          }
        }

        it("view output should not be nil") {
          expect(mockView.invokedOutput).toNot(beNil())
        }

        context("when view output runs") {
          context("with favoriteTapped") {
            it("viewModel should toggleFavored") {
              mockView.invokedOutput?(.favoriteTapped)

              expect(mockViewModel.invokedToggleFavoredCount).to(equal(1))
            }
          }
        }
      }
    }

    func createOffer(id: String = "0") -> Offer {
      return Offer(id: id, urlString: nil, name: "", description: "", terms: "", currentValue: "", favored: false)
    }
  }
}
