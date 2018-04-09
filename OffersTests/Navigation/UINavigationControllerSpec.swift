import Quick
import Nimble
import UIKit
@testable import Offers

class UINavigationControllerSpec: QuickSpec {
  override func spec() {
    var sut: UINavigationController!

    beforeEach {
      sut = UINavigationController()
    }

    afterEach {
      sut = nil
    }

    describe("a UINavigationController") {
      it("should conform to Presentable") {
        expect(sut).to(beAKindOf(Presentable.self))
      }

      describe("toPresent") {
        it("should return self") {
          expect(sut.toPresent()).to(be(sut))
        }
      }
    }
  }
}
