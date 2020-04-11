//
//  DetailUserViewController.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    private let contentView: DetailView
    let presenter: DetailUserPresenterType
    let user: User
    
    init(contentView: DetailView = DetailView(),
         presenter: DetailUserPresenterType,
         user: User) {
        self.contentView = contentView
        self.presenter = presenter
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.controller = self
        doesTheReposSearch()
    }
    
    func doesTheReposSearch() {
        presenter.searchForRepositores(user.login)
    }
}

extension DetailUserViewController: DetailUserViewControllerDelegate {
    func showDetailUser(repositores: [RepositoresUser]) {
        contentView.showModel(user: user, repositores: repositores)
    }
}
