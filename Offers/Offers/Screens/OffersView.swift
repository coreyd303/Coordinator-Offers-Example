//
// Created by Phillip Beadle on 4/6/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OffersView: class {
  func update(viewData: OffersViewData)
  var output: ((OffersViewOutput) -> Void)? { get set }
}

enum OffersViewOutput {
  case offerTapped(atIndex: Int)
}

class OffersViewImplementation: UIView, OffersView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  var output: ((OffersViewOutput) -> Void)? = nil
  private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout())
  private var viewData: OffersViewData {
    didSet {
      collectionView.reloadData()
    }
  }

  init() {
    viewData = OffersViewData(favorableOffers: [])
    super.init(frame: CGRect.zero)

    configureView()
    configureConstraints()
    configureStyles()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(viewData: OffersViewData) {
    self.viewData = viewData
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    output?(.offerTapped(atIndex: indexPath.item))
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewData.favorableOffers.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OffersCell.self), for: indexPath) as! OffersCell
    cell.configure(for: viewData.favorableOffers[indexPath.row])
    return cell
  }

  private func configureView() {
    addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(OffersCell.self, forCellWithReuseIdentifier: String(describing: OffersCell.self))
  }

  private func configureConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }

  private func configureStyles() {
    backgroundColor = .white
    collectionView.backgroundColor = .white
  }

  private static func flowLayout() -> UICollectionViewFlowLayout {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
    layout.minimumInteritemSpacing = 8
    layout.minimumLineSpacing = 24
    let screenWidth = UIScreen.main.bounds.width
    let itemWidth = (screenWidth - 32) / 2
    layout.itemSize = CGSize(width: itemWidth, height: itemWidth*0.95)
    return layout
  }
}
