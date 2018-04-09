//
// Created by Phillip Beadle on 4/5/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OfferDetailPresentable: Presentable {
  var output: ((OfferDetailPresentableOutput) -> Void)? { get set }
}

enum OfferDetailPresentableOutput: Equatable {
  case updateOffer(FavorableOffer)
}

class OfferDetailController: UIViewController, OfferDetailPresentable {
  var output: ((OfferDetailPresentableOutput) -> Void)?
  let viewModel: OfferDetailViewModel
  private var primaryView: OfferDetailView {
    return view as! OfferDetailView
  }

  init(viewModel: OfferDetailViewModel) {
    self.viewModel = viewModel

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = OfferDetailViewImplementation()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Offer Detail"

    viewModel.output = { [primaryView] viewData in
      primaryView.update(withViewData: viewData)
    }

    primaryView.output = { [unowned self] viewOutput in
      switch viewOutput {
      case .favoriteTapped:
        var updatedFavorableOffer = self.viewModel.favorableOffer
        updatedFavorableOffer.favored = !self.viewModel.favorableOffer.favored
        self.viewModel.favorableOffer = updatedFavorableOffer
        self.output?(.updateOffer(self.viewModel.favorableOffer))
      }
    }
  }
}
