//
// Created by Phillip Beadle on 2018-12-02.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import Quick
import Nimble
@testable import Offers

class BaseCoordinatorSpec: QuickSpec {
  override func spec() {
    var sut: BaseCoordinator!

    beforeEach {
      sut = BaseCoordinator()
    }

    afterEach {
      sut = nil
    }

    describe("a BaseCoordinator") {
      describe("addDependency") {
        context("when new coordinator is added") {
          it("childCoordinators should contain coordinator") {
            let stubCoordinator = MockCoordinator()

            sut.addDependency(stubCoordinator)

            expect(sut.childCoordinators.contains(where: { $0 === stubCoordinator })).to(beTrue())
          }
        }

        context("when existing coordinator is added") {
          it("childCoordinators should not contain two of the same coordinator references") {
            let stubCoordinator = MockCoordinator()

            sut.addDependency(stubCoordinator)
            sut.addDependency(stubCoordinator)

            expect(sut.childCoordinators.count).to(equal(1))
          }
        }
      }

      describe("removeDependency") {
        context("when passed in coordinator has childCoordinators of its own") {
          it("those child coordinators should be removed") {
            let stubCoordinator = BaseCoordinator()
            let stubChildCoordinator = BaseCoordinator()
            stubCoordinator.addDependency(stubChildCoordinator)
            sut.addDependency(stubCoordinator)

            sut.removeDependency(stubCoordinator)

            expect(stubCoordinator.childCoordinators.count).to(equal(0))
          }
        }

        context("when passed in coordinator exists in childCoordinators") {
          it("should be removed") {
            let stubCoordinator = MockCoordinator()
            sut.addDependency(stubCoordinator)

            sut.removeDependency(stubCoordinator)

            expect(sut.childCoordinators.count).to(equal(0))
          }
        }
      }
    }
  }
}

