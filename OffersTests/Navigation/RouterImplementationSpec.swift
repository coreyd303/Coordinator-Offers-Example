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
      UIViewController.resetSwizzles()
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

      context("navigation") {
        beforeEach {
          UINavigationController.swizzleMethods()
        }

        afterEach {
          UINavigationController.swizzleMethods()
        }

        describe("push") {
          it("should push") {
            sut.push(UIViewController())

            expect(UINavigationController.invokedPushCount).to(equal(1))
          }

          it("should push viewController onto navigationController") {
            let stubViewController = UIViewController()

            sut.push(stubViewController)

            expect(UINavigationController.invokedPushParameters?.viewController).to(be(stubViewController))
          }

          it("should push animated true") {
            sut.push(UIViewController())

            expect(UINavigationController.invokedPushParameters?.animated).to(beTrue())
          }
        }

        describe("present") {
          it("should present") {
            sut.present(UIViewController(), animated: true, completion: nil)

            expect(UINavigationController.invokedPresentCount).to(equal(1))
          }

          it("should present viewController onto navigationController") {
            let stubViewController = UIViewController()

            sut.present(stubViewController, animated: true, completion: nil)

            expect(UINavigationController.invokedPresentParameters?.viewController).to(be(stubViewController))
          }

          it("should present with matching animated") {
            sut.present(UIViewController(), animated: true, completion: nil)

            expect(UINavigationController.invokedPresentParameters?.animated).to(beTrue())
          }

          it("should present with matching animated") {
            sut.present(UIViewController(), animated: false, completion: nil)

            expect(UINavigationController.invokedPresentParameters?.animated).to(beFalse())
          }

          it("should present with matching completion") {
            var invokedCompletionCount = 0
            sut.present(UIViewController(), animated: false, completion: { invokedCompletionCount += 1 })
            UINavigationController.invokedPresentParameters?.completion?()

            expect(invokedCompletionCount).to(equal(1))
          }
        }

        describe("dismiss") {
          it("rootController should dismiss") {
            sut.dismiss(animated: true, completion: nil)

            expect(UINavigationController.invokedDismissCount).to(equal(1))
          }

          it("rootController should dismiss with matching animated") {
            sut.dismiss(animated: true, completion: nil)

            expect(UINavigationController.invokedDismissParameters?.animated).to(beTrue())
          }

          it("rootController should dismiss with matching animated") {
            sut.dismiss(animated: false, completion: nil)

            expect(UINavigationController.invokedDismissParameters?.animated).to(beFalse())
          }

          it("rootController should dismiss with matching completion") {
            var invokedCompletionCount = 0
            sut.dismiss(animated: false, completion: { invokedCompletionCount += 1 })
            UINavigationController.invokedDismissParameters?.completion?()

            expect(invokedCompletionCount).to(equal(1))
          }
        }
      }
    }
  }
}
