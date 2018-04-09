//
// Created by Phillip Beadle on 4/7/18.
// Copyright (c) 2018 Tablesand LLC. All rights reserved.
//

import UIKit

protocol OfferDetailView: class {
  func update(withViewData: OfferDetailViewData)
  var output: ((OfferDetailViewOutput) -> Void)? { get set }
}

enum OfferDetailViewOutput {
  case favoriteTapped
}

class OfferDetailViewImplementation: UIView, OfferDetailView {
  var output: ((OfferDetailViewOutput) -> Void)?
  private let tableView = UITableView()
  private var viewData: OfferDetailViewData {
    didSet {
      updateView()
    }
  }

  init() {
    viewData = OfferDetailViewData(data: [], url: nil, favorite: false)
    super.init(frame: CGRect.zero)

    configureView()
    configureConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(withViewData viewData: OfferDetailViewData) {
    self.viewData = viewData
  }

  private func updateView() {
    tableView.reloadData()
  }

  private func configureView() {
    tableView.register(OfferDetailHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: OfferDetailHeaderView.self))
    tableView.register(OfferDetailCell.self, forCellReuseIdentifier: String(describing: OfferDetailCell.self))
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 50
    tableView.allowsSelection = false
    addSubview(tableView)
  }

  private func configureConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }

  @objc func favoriteButtonTapped(sender: UIButton) {
    sender.isSelected = !sender.isSelected
    output?(.favoriteTapped)
  }
}

extension OfferDetailViewImplementation: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewData.data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OfferDetailCell.self), for: indexPath) as! OfferDetailCell
    cell.configure(forData: viewData.data[indexPath.item])
    return cell
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: OfferDetailHeaderView.self)) as! OfferDetailHeaderView
    headerView.configure(withImageUrl: viewData.url, favorite: viewData.favorite)
    headerView.favoriteButton.addTarget(self, action: #selector(self.favoriteButtonTapped), for: .touchUpInside)
    return headerView
  }
}
