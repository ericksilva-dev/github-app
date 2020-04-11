//
//  ListViewController.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    private let contentView: ListView
    private let presenter: ListPresenterProtocols = ListPresenter()
    weak var delegate: ListViewControllerDelegate?
    
    init(contentView: ListView = ListView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.controller = self
        presenter.reloadData()
        bindLayoutEvents()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setup() {
        bindLayoutEvents()
    }
    
    func bindLayoutEvents() {
        contentView.didSelectedUser = { [weak self] user in
            self?.delegate?.wantsToContinueDetailUser(user: user)
        }
    }
}

extension ListViewController: ListViewControllerType {
    func errorReloadView(error: String) {
        
    }
    
    func realodView(users: [AllUsers]) {
        contentView.show(users: users)
    }
}
