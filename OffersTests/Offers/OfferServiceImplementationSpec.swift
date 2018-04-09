import Quick
import Nimble
@testable import Offers

class OfferServiceImplementationSpec: QuickSpec {
  override func spec() {
    var sut: OfferServiceImplementation!

    beforeEach {
      sut = OfferServiceImplementation()
    }

    afterEach {
      sut = nil
    }

    describe("a OfferServiceImplementation") {
      it("should conform to OfferService") {
        expect(sut).to(beAKindOf(OfferService.self))
      }
    }
  }
}
