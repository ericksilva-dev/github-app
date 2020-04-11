//
//  SearchView.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    var didTapSearch: ((String?) -> Void)?
    
    private let logoApp: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.appLogo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleSearch: UILabel = {
        let label = UILabel()
        label.text = AppStrings.titleSearch
        label.font = UIFont.titleLargeLight
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let subTitleSearch: UILabel = {
        let label = UILabel()
        label.text = AppStrings.subTitleSearch
        label.font = UIFont.subTitleLargeBold
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let inputSearch: UITextField = {
        let input = UITextField()
        input.placeholder = AppStrings.placeholderSearch
        input.keyboardType = .default
        input.layout.applyConstraint { $0.height(65) }
        input.layer.borderWidth = 2
        input.layer.borderColor = Colors.whiteColor.cgColor
        input.layer.cornerRadius = 30
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
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect = .zero) {
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
        addSubview(logoApp)
        addSubview(titleSearch)
        addSubview(subTitleSearch)
        addSubview(inputSearch)
        addSubview(btnSearch)
    }
    
    private func addConstraints() {
        logoApp.layout.applyConstraint { view in
            view.top(alignedWith: self, offSet: 128)
            view.horizontalCenter(view: titleSearch)
            view.size(90)
        }
        titleSearch.layout.applyConstraint { view in
            view.under(view: logoApp, offSet: 36)
            view.left(alignedWith: self, offSet: 36)
            view.right(alignedWith: self, offSet: 36)
            
        }
        subTitleSearch.layout.applyConstraint { view in
            view.under(view: titleSearch, offSet: 16)
            view.horizontalCenter(view: titleSearch)
        }
        inputSearch.layout.applyConstraint { view in
            view.under(view: subTitleSearch, offSet: 136)
            view.left(alignedWith: self, offSet: 56)
            view.right(alignedWith: self, offSet: 56)
        }
        btnSearch.layout.applyConstraint { view in
            view.left(alignedWith: self, offSet: 90)
            view.right(alignedWith: self, offSet: 90)
            view.height(60)
            view.bottomSafaArea(alignedWith: self, offset: 128)
        }
    }
}

extension SearchView {
    private func addAction() {
        btnSearch.addTarget(self, action: #selector(btnSearchHandler), for: .touchUpInside)
    }
    
    @objc func btnSearchHandler() {
        didTapSearch?(inputSearch.text)
    }
}
