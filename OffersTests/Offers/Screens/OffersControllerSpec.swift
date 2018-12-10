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
              mockViewModel.stubbedOfferIDResult = "3"

              mockView.invokedOutput?(.offerTapped(atIndex: 0))

              expect(invokedOutput).to(equal(OffersPresentableOutput.offer(offerID: "3")))
            }
          }
        }

        it("viewModel output should not be nil") {
          expect(mockViewModel.invokedOutputSetterCount).to(equal(1))
        }

        context("when viewModel output runs") {
          it("view should update with matching viewData") {
            let stubViewData = OffersViewData(offers: [createOffer()])

            mockViewModel.invokedOutput?(stubViewData)

            expect(mockView.invokedUpdateParameters?.viewData).to(equal(stubViewData))
          }
        }
      }

      describe("didMove") {
        context("to nil parent") {
          it("should run finish") {
            var invokedFinishCount = 0
            sut.finish = {
              invokedFinishCount += 1
            }

            sut.didMove(toParent: nil)

            expect(invokedFinishCount).to(equal(1))
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
