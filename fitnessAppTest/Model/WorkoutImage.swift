//
//  WorkoutImage.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 7.08.2022.
//

import Foundation

struct WorkoutImage: Decodable {
    let medium: WorkoutThumbnail
}

struct WorkoutThumbnail: Decodable {
    let url: String
}
