//
//  User.swift
//  BlogSmart
//
//  Created by Edwin Dake on 4/14/23.
//

import Foundation

import ParseSwift

struct User: ParseUser {
    // These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // These are required by `ParseUser`.
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?

    // Custom properties.
    var lastPostedDate: Date?
    var blockedUsers: [String]?
}

extension User {
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
        self.blockedUsers = []
    }
}
