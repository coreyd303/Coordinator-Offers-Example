//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OffersPresentable: Presentable {
  var output: ((OffersPresentableOutput) -> ())? { get set }
}

enum OffersPresentableOutput: Equatable {
  case offer(offerID: String)
}

class OffersController: UIViewController, OffersPresentable {
  var output: ((OffersPresentableOutput) -> ())?
  let viewModel: OffersViewModel
  private var primaryView: OffersView {
    return view as! OffersView
  }

  init(viewModel: OffersViewModel) {
    self.viewModel = viewModel

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = OffersViewImplementation()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Offers"

    primaryView.output = { [output, viewModel] offersViewOutput in
      switch offersViewOutput {
      case .offerTapped(let index):
        output?(.offer(offerID: viewModel.offerID(atIndex: index)))
      }
    }

    viewModel.output = { [primaryView] viewData in
      primaryView.update(viewData: viewData)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    getOffers()
  }

  // MARK: - Private

  private func getOffers() {
    viewModel.getOffers()
  }
}
