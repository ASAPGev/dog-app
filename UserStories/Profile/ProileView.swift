//
//  ProileView.swift
//  Dog
//
//  Created by Мадина Валиева on 22.10.2024.
//

import SwiftUI

struct ProileView: View {
    
    @State private var avatar: UIImage?
    
    @StateObject private var networkManager = NetworkManager()
    @State private var breedName = "akita"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter breed name", text: $breedName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        Task {
                            await networkManager.fetchDogs(byName: breedName)
                        }
                    }
                
                if networkManager.dogs.isEmpty {
                    Text("No data available")
                        .foregroundColor(.gray)
                } else {
                    List(networkManager.dogs) { dog in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: dog.imageLink!)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(dog.name!)
                                .font(.headline)
                            Text("Good with children: \(dog.goodWithChildren)")
                            Text("Life expectancy: \(dog.minLifeExpectancy)-\(dog.maxLifeExpectancy) years")
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Dog Breeds")
            .task {
                await networkManager.fetchDogs(byName: breedName)
            }
        }
        //        VStack() {
        //            avatarView
        //            Text("")
        //            Spacer()
        //            Text("Border collie")
        //        }
    }
    
    //        private var avatarView: some View {
    //            Group {
    //                AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { phase in
    //                    switch phase {
    //                    case .failure:
    //                        Image(systemName: "photo")
    //                            .font(.largeTitle)
    //                    case .success(let image):
    //                        image
    //                            .resizable()
    //                    default:
    //                        ProgressView()
    //                    }
    //                }
    //                .frame(width: 70, height: 70)
    //                .clipShape(.rect(cornerRadius: 70))
    //            }
    //        }
}

#Preview {
    ProileView()
}
