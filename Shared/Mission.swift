//
//  Mission.swift
//  Moonshot
//
//  Created by Erik Mikac on 3/24/21.
//

import Foundation
struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Applo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        }
        return "NA"
    }
    
}
