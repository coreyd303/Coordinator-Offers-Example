import Quick
import Nimble
import UIKit
@testable import Offers

class UIWindowSpec: QuickSpec {
  override func spec() {
    var sut: UIWindow!

    beforeEach {
      sut = UIWindow()
    }

    afterEach {
      sut = nil
    }

    describe("a UIWindow") {
      it("should conform to WindowProviding") {
        expect(sut).to(beAKindOf(WindowProviding.self))
      }

      describe("setRootPresentable") {
        it("rootViewController should match") {
          let stubPresentable = UIViewController()

          sut.setRootPresentable(stubPresentable)

          expect(sut.rootViewController).to(be(stubPresentable))
        }
      }
    }
  }
}
