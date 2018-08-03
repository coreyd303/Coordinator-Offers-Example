import Quick
import Nimble
import UIKit
@testable import Offers

class UIViewControllerSpec: QuickSpec {
  override func spec() {
    var sut: UIViewController!

    beforeEach {
      sut = UIViewController()
    }

    afterEach {
      sut = nil
      UIViewController.resetSwizzles()
    }

    describe("a UIViewController") {
      it("should conform to Presentable") {
        expect(sut).to(beAKindOf(Presentable.self))
      }

      it("should conform to Presenter") {
        expect(sut).to(beAKindOf(Presenter.self))
      }

      describe("present") {
        beforeEach {
          UIViewController.swizzleMethods()
        }

        afterEach {
          UIViewController.swizzleMethods()
        }

        it("should present") {
          sut.present(MockPresentable(), animated: true, completion: nil)

          expect(UIViewController.invokedPresentCount).to(equal(1))
        }

        it("should present viewController onto viewController") {
          let stubPresentable = UIViewController()

          sut.present(stubPresentable, animated: true, completion: nil)

          expect(UIViewController.invokedPresentParameters?.viewController).to(be(stubPresentable))
        }

        it("should present with matching animated") {
          sut.present(MockPresentable(), animated: true, completion: nil)

          expect(UIViewController.invokedPresentParameters?.animated).to(beTrue())
        }

        it("should present with matching animated") {
          sut.present(MockPresentable(), animated: false, completion: nil)

          expect(UIViewController.invokedPresentParameters?.animated).to(beFalse())
        }

        it("should present with matching completion") {
          var invokedCompletionCount = 0
          sut.present(MockPresentable(), animated: false, completion: { invokedCompletionCount += 1 })
          UIViewController.invokedPresentParameters?.completion?()

          expect(invokedCompletionCount).to(equal(1))
        }
      }

      describe("dismiss") {
        beforeEach {
          UIViewController.swizzleMethods()
        }

        afterEach {
          UIViewController.swizzleMethods()
        }

        it("rootController should dismiss") {
          sut.dismiss(animated: true, completion: nil)

          expect(UIViewController.invokedDismissCount).to(equal(1))
        }

        it("rootController should dismiss with matching animated") {
          sut.dismiss(animated: true, completion: nil)

          expect(UIViewController.invokedDismissParameters?.animated).to(beTrue())
        }

        it("rootController should dismiss with matching animated") {
          sut.dismiss(animated: false, completion: nil)

          expect(UIViewController.invokedDismissParameters?.animated).to(beFalse())
        }

        it("should dismiss with matching completion") {
          var invokedCompletionCount = 0
          sut.dismiss(animated: false, completion: { invokedCompletionCount += 1 })
          UIViewController.invokedDismissParameters?.completion?()

          expect(invokedCompletionCount).to(equal(1))
        }
      }
    }
  }
}
