//
//  WorkoutDetail.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 7.08.2022.
//

import Foundation

struct WorkoutDetail: Decodable {
    let results: [ExerciseInfo]
}

struct ExerciseInfo: Decodable {
    let id: Int
    let name: String
    let description: String
}
