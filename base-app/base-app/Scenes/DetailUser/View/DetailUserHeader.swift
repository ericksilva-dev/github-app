//
//  DetailUserHeader.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

final class DetailUserHeader: UIView {
    
    private let avatarUser: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 34
        imageView.contentMode = .scaleAspectFit
        imageView.layout.applyConstraint { $0.size(68) }
        return imageView
    }()
    
    private let nameUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let followersUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let followingUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.mediumString
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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
    }
    
    private func buildViewHierarchy() {
        addSubview(avatarUser)
        addSubview(nameUser)
        addSubview(followersUser)
        addSubview(followingUser)
    }
    
    private func addConstraints() {
        avatarUser.layout.applyConstraint { view in
            view.horizontalCenter(view: self)
            view.top(alignedWith: self, offSet: 8)
        }
        nameUser.layout.applyConstraint { view in
            view.under(view: avatarUser, offSet: 16)
            view.left(alignedWith: self, offSet: 16)
        }
        followersUser.layout.applyConstraint { view in
            view.horizontalCenter(view: avatarUser)
            view.under(view: avatarUser, offSet: 16)
            view.right(of: nameUser, offSet: 16)
        }
        followingUser.layout.applyConstraint { view in
            view.under(view: avatarUser, offSet: 16)
            view.right(of: followersUser, offSet: 16)
            view.right(alignedWith: self, offSet: 16)
        }
    }
}

extension DetailUserHeader: DetailUserHeaderType {
    func showHeaderModel(user: User) {
        avatarUser.setImage(from: user.avatar_url)
        nameUser.text = user.name
        followersUser.text = "Seguidores \(String(user.followers))"
        followingUser.text = "Seguindo \(String(user.following))"
    }
}
