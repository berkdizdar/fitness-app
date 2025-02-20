//
//  ContentView.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                mainFullbodyCard.padding(.horizontal, 100)
                splitWorkouts
                Spacer()
            }
            .background(
                LinearGradient(
                    colors: [.mint.opacity(0.8), .blue],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            .navigationBarTitle("Workout Plan")
            }
        }
    }
    
    // MARK: - Views
    var mainFullbodyCard: some View {
        HStack {
            NavigationLink {
                DetailView(id: "4")
            } label: {
                fullbodyCard
            }

            Spacer()
        }
    }
    
    
    var fullbodyCard: some View {
        ZStack {
            Image("FullBodyWorkout")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            VStack {
                Spacer()
                Text("Full Body Workout")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("For Beginners")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 30)
            }
        }
        .frame(width: 230)
        .scaledToFit()
    }
    
    var splitWorkouts: some View {
        VStack {
            Text("Split Workouts")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(WorkoutProgram.programs) { program in
                        NavigationLink {
                            DetailView(id: program.apiId)
                        } label: {
                            makeWorkoutCard(
                                imageName: program.imageName,
                                day: program.day,
                                workoutName: program.workoutName
                            )
                            .padding()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    private func makeWorkoutCard(imageName: String, day: String, workoutName: String) -> some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Spacer()
                Text(day)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(workoutName)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            .padding()
            
        }
        
        .frame(width: 150, height: 300)
        .cornerRadius(20)
        .shadow(radius: 10)
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
