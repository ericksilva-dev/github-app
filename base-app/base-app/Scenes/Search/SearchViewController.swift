//
//  ViewController.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let contentView: SearchView
    
    init(contentView: SearchView = SearchView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        bindLayoutEvents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func bindLayoutEvents() {
        contentView.didTapSearch = { [weak self] in
            print("Clicou")
        }
    }
}

