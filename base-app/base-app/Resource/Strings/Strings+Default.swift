//
//  Strings+Default.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

public class AppStrings {
    private static let tableName = "Strings+Default"
    
    // MARK: - LocalizedString : SearchViewController
    public static let titleSearch = localizedString(forKey: "titleSearch")
    public static let subTitleSearch = localizedString(forKey: "subTitleSearch")
    public static let placeholderSearch = localizedString(forKey: "placeholderSearch")
    public static let buttonSearch = localizedString(forKey: "buttonSearch")
    // MARK: - LocalizedString : ListViewController
    public static let titleList = localizedString(forKey: "titleList")
    public static let placeholderSearchUser = localizedString(forKey: "placeholderSearchUser")
}

private extension AppStrings {
    static func localizedString(forKey key: String) -> String {
        let bundle = Bundle(for: AppStrings.self)
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
}
