//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit
import SDWebImage

class OffersCell: UICollectionViewCell {
  private let imageBackgroundView = UIView()
  private let offerImageView = UIImageView()
  private let currentValueLabel = UILabel()
  private let favoriteImageView = UIImageView()
  private let nameLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
    configureConstraints()
    configureStyles()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureView() {
    imageBackgroundView.layer.cornerRadius = 5
    contentView.addSubview(imageBackgroundView)
    offerImageView.contentMode = .scaleAspectFit
    favoriteImageView.contentMode = .scaleAspectFit

    contentView.addSubview(offerImageView)
    contentView.addSubview(currentValueLabel)
    contentView.addSubview(favoriteImageView)
    contentView.addSubview(nameLabel)
  }

  private func configureConstraints() {
    imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    imageBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    imageBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    imageBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    imageBackgroundView.heightAnchor.constraint(equalTo: imageBackgroundView.widthAnchor, multiplier: 0.65).isActive = true

    offerImageView.translatesAutoresizingMaskIntoConstraints = false
    offerImageView.topAnchor.constraint(equalTo: imageBackgroundView.topAnchor, constant: 6).isActive = true
    offerImageView.leadingAnchor.constraint(equalTo: imageBackgroundView.leadingAnchor, constant: 6).isActive = true
    offerImageView.bottomAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: -6).isActive = true
    offerImageView.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: -6).isActive = true

    currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
    currentValueLabel.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 8).isActive = true
    currentValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    currentValueLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3).isActive = true
    currentValueLabel.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)

    favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
    favoriteImageView.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 6).isActive = true
    favoriteImageView.leadingAnchor.constraint(equalTo: currentValueLabel.trailingAnchor, constant: 4).isActive = true
    favoriteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
    favoriteImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3).isActive = true
    favoriteImageView.widthAnchor.constraint(equalTo: favoriteImageView.heightAnchor, multiplier: 1).isActive = true

    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }

  private func configureStyles() {
    imageBackgroundView.backgroundColor = Color.backgroundGray
    currentValueLabel.font = Fonts.demiBold.font(withSize: 12)
    currentValueLabel.textColor = Color.text
    favoriteImageView.isAccessibilityElement = true
    nameLabel.font = Fonts.regular.font(withSize: 11)
    nameLabel.textColor = Color.text
  }
}

extension OffersCell {
  func configure(for offer: Offer) {
    offerImageView.sd_setImage(with: offer.url, placeholderImage: Images.placeholder.image)
    currentValueLabel.text = offer.currentValue
    favoriteImageView.image = offer.favored ? Images.heartSelected.image : Images.heart.image
    favoriteImageView.accessibilityIdentifier = offer.favored ? Images.heartSelected.rawValue: Images.heart.rawValue
    nameLabel.text = offer.name
  }
}
