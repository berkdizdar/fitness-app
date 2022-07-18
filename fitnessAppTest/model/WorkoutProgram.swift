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
}

extension WorkoutProgram {
    static let programs = [
        WorkoutProgram(imageName: "ChestDay", day: "Monday", workoutName: "Chest Day"),
        WorkoutProgram(imageName: "BackDay", day: "Tuesday", workoutName: "Back Day"),
        WorkoutProgram(imageName: "LegDay", day: "Wednesday", workoutName: "Leg Day"),
        WorkoutProgram(imageName: "ArmDay", day: "Thursday", workoutName: "Arm Day"),
        WorkoutProgram(imageName: "CoreDay", day: "Friday", workoutName: "Core Day"),
    ]
}
