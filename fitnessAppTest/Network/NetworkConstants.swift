//
//  NetworkConstants.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 7.08.2022.
//

import Foundation

enum NetworkConstants: String {
    // MARK: - Base URL
    case mainUrl = "https://wger.de"
    case baseUrl = "https://wger.de/api/v2/"
    
    // MARK: - EndPoints
    case exercise = "exercise/"
    case exerciseImage = "exerciseimage/"
    
    // MARK: - Queries
    case muscles = "?muscles="
    case thumbnails = "thumbnails/"
}
