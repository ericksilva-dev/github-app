//
//  ListTableViewCell.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifair = "UserCells"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = .zero
        return view
    }()

    private lazy var imageUser: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFit
        imageView.layout.applyConstraint { $0.size(80) }
        return imageView
    }()
    
    private lazy var loginUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        containerView.layer.shadowColor = UIColor.black.cgColor
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.backgroundColorDefault
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(user: AllUsers) {
        imageUser.setImage(from: user.avatar_url)
        loginUser.text = "@\(user.login)"
    }
    
    func setupUI() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageUser)
        containerView.addSubview(loginUser)
    }
    
    private func addConstraints() {
        imageUser.layout.applyConstraint { view in
            view.top(alignedWith: contentView, offSet: 4)
            view.left(alignedWith: contentView, offSet: 16)
        }
        loginUser.layout.applyConstraint { view in
            view.verticalCenter(view: imageUser)
            view.right(of: imageUser, offSet: 10)
            view.right(alignedWith: contentView, offSet: 8)
        }
        containerView.layout.applyConstraint { view in
            view.top(alignedWith: self, offSet: 8)
            view.left(alignedWith: self, offSet: 8)
            view.right(alignedWith: self, offSet: 8)
            view.bottom(alignedWith: self, offSet: 8)
        }
    }
}
