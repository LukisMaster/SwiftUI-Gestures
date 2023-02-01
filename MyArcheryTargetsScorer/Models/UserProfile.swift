//
//  UserProfile.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 28.01.2023.
//

import Foundation

protocol UserProfileProtocol {
    var firstName : String { get }
    var lastName: String? { get }
    var birthday: Date? { get }
    var club: String? { get }
}

struct UserProfile: UserProfileProtocol {
    var firstName: String
    var lastName: String?
    var birthday: Date?
    var club: String?
}
