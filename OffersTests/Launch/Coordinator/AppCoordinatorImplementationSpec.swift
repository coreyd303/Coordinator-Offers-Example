import Quick
import Nimble
@testable import Offers

class AppCoordinatorImplementationSpec: QuickSpec {

  override func spec() {
    var mockWindow: MockWindowProviding!
    var mockOffersCoordinator: MockOffersCoordinator!
    var mockAppChildCoordinatorFactory: MockAppChildCoordinatorFactory!
    var mockRouter: MockRouter!
    var mockAppPresentableFactory: MockAppPresentableFactory!
    var sut: AppCoordinatorImplementation!

    beforeEach {
      mockWindow = MockWindowProviding()
      mockOffersCoordinator = MockOffersCoordinator()
      mockAppChildCoordinatorFactory = MockAppChildCoordinatorFactory()
      mockAppChildCoordinatorFactory.stubbedMakeOffersCoordinatorResult = mockOffersCoordinator
      mockRouter = MockRouter()
      mockAppPresentableFactory = MockAppPresentableFactory()
      mockAppPresentableFactory.stubbedMakeRouterResult = mockRouter
      sut = AppCoordinatorImplementation(window: mockWindow, coordinatorFactory: mockAppChildCoordinatorFactory, presentableFactory: mockAppPresentableFactory)
    }

    afterEach {
      sut = nil
    }

    describe("a AppCoordinatorImplementation") {
      it("should conform to AppCoordinator") {
        expect(sut).to(beAKindOf(AppCoordinator.self))
      }

      describe("start") {
        beforeEach {
          sut.start()
        }

        it("presentableFactory should makeRouter") {
          expect(mockAppPresentableFactory.invokedMakeRouterCount).to(equal(1))
        }

        it("window should setRootPresentable") {
          expect(mockWindow.invokedSetRootPresentableCount).to(equal(1))
        }

        it("window should setRootPresentable with router from presentableFactory") {
          expect(mockWindow.invokedSetRootPresentableParameters?.presentable).to(be(mockAppPresentableFactory.stubbedMakeRouterResult))
        }

        it("coordinatorFactory should makeOffersCoordinator") {
          expect(mockAppChildCoordinatorFactory.invokedMakeOffersCoordinatorCount).to(equal(1))
        }

        it("coordinatorFactory should makeOffersCoordinator with matching router from presentableFactory") {
          expect(mockAppChildCoordinatorFactory.invokedMakeOffersCoordinatorParameters?.router).to(be(mockAppPresentableFactory.stubbedMakeRouterResult))
        }

        it("should set offersCoordinator with offersCoordinator from coordinatorFactory") {
          expect(sut.offersCoordinator).to(be(mockAppChildCoordinatorFactory.stubbedMakeOffersCoordinatorResult))
        }

        it("offersCoordinator should start") {
          expect(mockOffersCoordinator.invokedStartCount).to(equal(1))
        }
      }
    }
  }
}