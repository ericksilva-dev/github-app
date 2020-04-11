//
//  DetailUserView.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

final class DetailView: UIView {
    
    private var detailHeader: DetailUserHeader = DetailUserHeader()
    
    private let totalRepos: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let loginUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.smallString
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let tableView: UITableView = UITableView()
    
    private var tableViewDataSource: DetailUserDataSource?
    
    init(dataSource: DetailUserDataSource? =  nil) {
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
    }
    
    private func setupTableView(repositores: [RepositoresUser]) {
        let tableViewDataSource = DetailUserDataSource(repos: repositores)
        self.tableViewDataSource = tableViewDataSource
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.backgroundColorDefault
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableView.register(DetailUserCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    private func buildViewHierarchy() {
        addSubview(detailHeader)
        addSubview(totalRepos)
        addSubview(loginUser)
        addSubview(tableView)
    }
    
    private func addConstraints() {
        detailHeader.layout.applyConstraint { view in
            view.topSafeArea(aligneWith: self)
            view.leftSafeArea(alinedWith: self)
            view.rightSafeArea(alignedWith: self)
            view.height(140)
        }
        totalRepos.layout.applyConstraint { view in
            view.under(view: detailHeader, offSet: 32)
            view.left(alignedWith: self, offSet: 16)
            view.right(alignedWith: self, offSet: 16)
        }
        loginUser.layout.applyConstraint { view in
            view.under(view: totalRepos, offSet: 8)
            view.left(alignedWith: self, offSet: 16)
            view.right(alignedWith: self, offSet: 16)
        }
        tableView.layout.applyConstraint { view in
            view.under(view: loginUser, offSet: 16)
            view.left(alignedWith: self)
            view.right(alignedWith: self)
            view.bottom(alignedWith: self, offSet: 16)
        }
    }
}

extension DetailView: DetailUserViewType {
    func showModel(user: User, repositores: [RepositoresUser]) {
        totalRepos.text = "Total de Repositórios \(repositores.count)"
        loginUser.text = "@\(user.login)"
        detailHeader.showHeaderModel(user: user)
        setupTableView(repositores: repositores)
    }
}
