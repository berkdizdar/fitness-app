//
//  DetailView.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 2.08.2022.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    let id: String
    @State var backgroundColor: Color = Color.mint
    
    private var selectedExerciseDescription: String {
        viewModel.workoutDetails.first(where: { $0.id == viewModel.selectedExerciseId })?.description ?? "Açıklama bulunamadı"
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            if viewModel.isLoading {
                ProgressView()
            }
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.workoutDetails, id: \.id) { workout in
                        makeExerciseRow(title: workout.name, selectedId: workout.id)
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getData(for: id)
        }
        .sheet(isPresented: $viewModel.presentSheet) {
            exerciseDetail
        }
    }
    
    // MARK: - Views
    var exerciseDetail: some View {
        VStack(spacing: 0) {
            if viewModel.presentOnlyDescription {
                Text("Image does not exists")
                    .padding(.top)
            } else {
                KFImage(URL(string: NetworkConstants.mainUrl.rawValue + viewModel.selectedExerciseImageURL))
                    .padding(.top)
            }
            
            Text(selectedExerciseDescription)
                .padding(.top)
        }
    }
    
    private func makeExerciseRow(title: String, selectedId: Int) -> some View {
        Button {
            viewModel.selectedExerciseId = selectedId
            viewModel.getImage(for: "\(selectedId)")
        } label: {
            HStack(spacing: 0) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "arrow.right")
                    .padding(.trailing)
            }
        }
        .disabled(viewModel.isLoading)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "2")
    }
}
