//
//  ListDataSource.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

protocol ListDataSourceDelegate: class {
    func didSelected(user: AllUsers)
}

class ListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: ListDataSourceDelegate?
    let users: [AllUsers]
    
    init(users: [AllUsers], delegate: ListDataSourceDelegate?) {
        self.users = users
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("COUNT USERS: ----\(users)")
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifair, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.show(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = users[indexPath.row]
        delegate?.didSelected(user: item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
