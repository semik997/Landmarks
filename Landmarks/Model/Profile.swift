//
//  Profile.swift
//  Landmarks
//
//  Created by Sem Koliesnikov on 28/03/2023.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonPalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "s_koliesnikov")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
