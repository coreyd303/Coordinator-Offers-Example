//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit
import SDWebImage

class OfferDetailHeaderView: UITableViewHeaderFooterView {
  let imageView = UIImageView()
  let favoriteButton = UIButton()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    configureView()
    configureConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureView() {
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    favoriteButton.setImage(Images.heart.image, for: .normal)
    favoriteButton.setImage(Images.heartSelected.image, for: .selected)
    addSubview(favoriteButton)
  }

  private func configureConstraints() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

    favoriteButton.translatesAutoresizingMaskIntoConstraints = false
    favoriteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    favoriteButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
    favoriteButton.heightAnchor.constraint(equalTo: favoriteButton.widthAnchor, multiplier: 1).isActive = true
  }
}

extension OfferDetailHeaderView {
  func configure(withImageUrl url: URL?, favorite: Bool) {
    imageView.sd_setImage(with: url, placeholderImage: Images.placeholder.image)
    favoriteButton.isSelected = favorite
  }
}
