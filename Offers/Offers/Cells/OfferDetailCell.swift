//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

class OfferDetailCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

    configureStyles()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureStyles() {
    textLabel?.font = Fonts.demiBold.font(withSize: 14)
    textLabel?.textColor = Color.text
    detailTextLabel?.font = Fonts.regular.font(withSize: 13)
    detailTextLabel?.textColor = Color.text
    detailTextLabel?.lineBreakMode = .byWordWrapping
    detailTextLabel?.numberOfLines = 0
  }
}

extension OfferDetailCell {
  func configure(forData data: OfferDetailViewData.Data) {
    textLabel?.text = data.title
    detailTextLabel?.text = data.detail
  }
}
