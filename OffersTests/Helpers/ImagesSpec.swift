//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Quick
import Nimble
@testable import Offers

class ImagesSpec: QuickSpec {
  override func spec() {
    var sut: Images!

    beforeEach {
      sut = Images.heart
    }

    afterEach {
      sut = nil
    }

    describe("image") {
      context("heart") {
        it("should not be nil") {
          sut = Images.heart

          expect(sut).toNot(beNil())
        }
      }

      context("heartSelected") {
        it("should not be nil") {
          sut = Images.heartSelected

          expect(sut.image).toNot(beNil())
        }
      }

      context("placeholder") {
        it("should not be nil") {
          sut = Images.placeholder

          expect(sut.image).toNot(beNil())
        }
      }
    }
  }
}

