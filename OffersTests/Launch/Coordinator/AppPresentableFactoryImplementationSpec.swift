import Quick
import Nimble
import UIKit
@testable import Offers

class AppPresentableFactoryImplementationSpec: QuickSpec {
  override func spec() {
    var sut: AppPresentableFactoryImplementation!

    beforeEach {
      sut = AppPresentableFactoryImplementation()
    }

    afterEach {
      sut = nil
    }

    describe("a AppPresentableFactoryImplementation") {
      it("should conform to AppPresentableFactory") {
        expect(sut).to(beAKindOf(AppPresentableFactory.self))
      }

      describe("makeRouter") {
        it("should return a Router") {
          expect(sut.makeRouter()).to(beAKindOf(Router.self))
        }

        it("should return a RouterImplementation") {
          expect(sut.makeRouter()).to(beAKindOf(RouterImplementation.self))
        }

        it("should init with a UINavigationController rootController") {
          expect((sut.makeRouter() as! RouterImplementation).rootController).to(beAKindOf(UINavigationController.self))
        }
      }
    }
  }
}
