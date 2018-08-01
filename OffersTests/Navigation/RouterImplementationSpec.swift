import Quick
import Nimble
import UIKit
@testable import Offers

class RouterImplementationSpec: QuickSpec {
  override func spec() {
    var stubNavigationController: UINavigationController!
    var sut: RouterImplementation!

    beforeEach {
      stubNavigationController = UINavigationController()
      sut = RouterImplementation(rootController: stubNavigationController)
    }

    afterEach {
      sut = nil
    }

    describe("a RouterImplementation") {
      it("should conform to Router") {
        expect(sut).to(beAKindOf(Router.self))
      }

      it("should conform to Presentable") {
        expect(sut).to(beAKindOf(Presentable.self))
      }

      describe("init") {
        it("should set matching rootController") {
          expect(sut.rootController).to(be(stubNavigationController))
        }
      }

      describe("setRootPresentable") {
        it("rootController should setViewControllers with matching presentable.toPresent") {
          let stubPresentable = UIViewController()

          sut.setRootPresentable(stubPresentable)

          expect(sut.rootController.viewControllers.first).to(be(stubPresentable))
        }
      }

      describe("toPresent") {
        it("should return the rootController") {
          expect(sut.toPresent()).to(be(stubNavigationController))
        }
      }
    }
  }
}
