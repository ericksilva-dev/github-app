//
//  ListView.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ListView: UIView {
    var didSelectedUser: ((AllUsers) -> Void)?
    private let containerView: UIView = {
        let view =  UIView()
        return view
    }()
    private let tableView: UITableView = UITableView()
    
    private let titleList: UILabel = {
        let label = UILabel()
        label.text = AppStrings.titleList
        label.font = UIFont.titleLargeLight
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let inputSearch: UITextField = {
        let input = UITextField()
        input.placeholder = AppStrings.placeholderSearchUser
        input.keyboardType = .default
        input.layout.applyConstraint { $0.height(50) }
        input.layer.borderWidth = 2
        input.layer.borderColor = Colors.whiteColor.cgColor
        input.layer.cornerRadius = 25
        input.layer.masksToBounds = true
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        input.leftView = leftView
        input.leftViewMode = .always
        return input
    }()
    
    private let btnSearch: UIButton = {
        let button = UIButton()
        button.setTitle(AppStrings.buttonSearch, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = Colors.btnColorSecundary.cgColor
        button.backgroundColor = Colors.btnColorPrimary
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }()
    
    private var tableViewDataSource: ListDataSource?
    
    init(dataSource: ListDataSource? =  nil) {
        self.tableViewDataSource = dataSource
        super.init(frame: .zero)
        self.backgroundColor = Colors.backgroundColorDefault
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        buildViewHierarchy()
        addConstraints()
        addAction()
    }
    
    private func buildViewHierarchy() {
        containerView.addSubview(titleList)
        containerView.addSubview(inputSearch)
        containerView.addSubview(btnSearch)
        addSubview(containerView)
        addSubview(tableView)
    }
    private func setupTableView(users: [AllUsers]) {
        let tableViewDataSource = ListDataSource(users: users, delegate: self)
        self.tableViewDataSource = tableViewDataSource
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.backgroundColorDefault
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifair)
        tableView.reloadData()
    }
    private func addConstraints() {
        titleList.layout.applyConstraint { view in
            view.top(alignedWith: containerView, offSet: 8)
            view.left(alignedWith: containerView, offSet: 26)
            view.right(alignedWith: containerView, offSet: 16)
        }
        inputSearch.layout.applyConstraint { view in
            view.under(view: titleList, offSet: 20)
            view.left(alignedWith: containerView, offSet: 26)
            view.left(of: btnSearch, offSet: 26)
        }
        btnSearch.layout.applyConstraint { view in
            view.verticalCenter(view: inputSearch)
            view.height(50)
            view.right(alignedWith: containerView, offSet: 8)
        }
        containerView.layout.applyConstraint { view in
            view.topSafeArea(aligneWith: self, offset: 16)
            view.leftSafeArea(alinedWith: self)
            view.rightSafeArea(alignedWith: self)
            view.height(170)
        }
        tableView.layout.applyConstraint { view in
            view.under(view: containerView, offSet: 16)
            view.left(alignedWith: self)
            view.right(alignedWith: self)
            view.bottom(alignedWith: self)
        }
    }
    private func addAction() {}
}
extension ListView: ListViewType {
    func show(users: [AllUsers]) {
        setupTableView(users: users)
    }
}
extension ListView: ListDataSourceDelegate {
    func didSelected(user: AllUsers) {
        didSelectedUser?(user)
    }
}
