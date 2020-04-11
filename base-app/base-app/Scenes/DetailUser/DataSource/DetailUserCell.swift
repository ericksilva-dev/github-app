//
//  DetailUserCell.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 11/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

final class DetailUserCell: UITableViewCell {
    
    private let nameRepositore: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let languageRepositore: UILabel = {
        let label = UILabel()
        label.font = UIFont.smallString
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func preparer(repositore: RepositoresUser) {
        nameRepositore.text = repositore.name
        languageRepositore.text = repositore.language
    }
    
    func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(nameRepositore)
        addSubview(languageRepositore)
    }
    
    private func addConstraints() {
        nameRepositore.layout.applyConstraint { view in
            view.top(alignedWith: self, offSet: 8)
            view.left(alignedWith: self, offSet: 16)
            view.right(alignedWith: self, offSet: 16)
        }
        languageRepositore.layout.applyConstraint { view in
            view.under(view: nameRepositore, offSet: 4)
            view.left(alignedWith: self, offSet: 16)
            view.right(alignedWith: self, offSet: 16)
        }
    }
}
