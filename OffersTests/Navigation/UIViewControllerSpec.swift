import Quick
import Nimble
@testable import Offers

class UIViewControllerSpec: QuickSpec {
  override func spec() {
    var sut: UIViewController!

    beforeEach {
      sut = UIViewController()
    }

    afterEach {
      sut = nil
    }

    describe("a UIViewController") {
      it("should conform to Presentable") {
        expect(sut).to(beAKindOf(Presentable.self))
      }
    }
  }
}
