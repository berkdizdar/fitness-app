//
//  File.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 18.07.2022.
//

import Foundation

struct WorkoutProgram: Identifiable {
    var id = UUID()
    let imageName: String
    let day: String
    let workoutName: String
    let apiId: String
}

extension WorkoutProgram {
    static let programs = [
        WorkoutProgram(imageName: "ChestDay", day: "Monday", workoutName: "Chest Day", apiId: "4"),
        WorkoutProgram(imageName: "BackDay", day: "Tuesday", workoutName: "Back Day", apiId: "12"),
        WorkoutProgram(imageName: "LegDay", day: "Wednesday", workoutName: "Leg Day", apiId: "8"),
        WorkoutProgram(imageName: "ArmDay", day: "Thursday", workoutName: "Arm Day", apiId: "1"),
        WorkoutProgram(imageName: "CoreDay", day: "Friday", workoutName: "Core Day", apiId: "6"),
    ]
}
