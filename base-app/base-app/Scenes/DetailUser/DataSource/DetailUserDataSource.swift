//
//  DetailUserDataSource.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

final class DetailUserDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let repos: [RepositoresUser]
    
    init(repos: [RepositoresUser]) {
        self.repos = repos
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailUserCell else {
            return UITableViewCell()
        }
        cell.preparer(repositore: repos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
