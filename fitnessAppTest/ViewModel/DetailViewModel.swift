//
//  DetailViewModel.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 7.08.2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var workoutDetails = [ExerciseInfo]()
    @Published var selectedExerciseId = -1
    @Published var presentSheet = false
    @Published var selectedExerciseImageURL = ""
    @Published var isLoading = false
    @Published var presentOnlyDescription = false
    
    private var workoutEndpoint: String {
        NetworkConstants.exercise.rawValue +
        NetworkConstants.muscles.rawValue
    }
    
    private var imageEndpoint: String {
        NetworkConstants.exerciseImage.rawValue +
        "\(selectedExerciseId)/" +
        NetworkConstants.thumbnails.rawValue
    }
    
    func getData(for id: String) {
        isLoading = true
        NetworkService
            .fetchData(
                from: workoutEndpoint + id,
                response: WorkoutDetail.self) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self.workoutDetails = data.results
                        case .failure(let error):
                            print(error)
                            self.presentOnlyDescription = true
                        }
                        self.isLoading = false
                    }
                }
    }
    
    func getImage(for id: String) {
        isLoading = true
        NetworkService
            .fetchData(
                from: imageEndpoint,
                response: WorkoutImage.self) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self.selectedExerciseImageURL = data.medium.url
                            self.presentOnlyDescription = false
                        case .failure(let error):
                            print(error)
                            self.presentOnlyDescription = true
                        }
                        self.presentSheet = true
                        self.isLoading = false
                    }
                }
    }
}
