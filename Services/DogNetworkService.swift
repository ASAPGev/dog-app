//
//  DogNetworkService.swift
//  Dog
//
//  Created by MANVELYAN Gevorg on 29.11.2024.
//

import Foundation

protocol IDogNetworkService {
    
}

final class DogNetworkService {
    @Published var dogs: [Dog] = []
    private let apiKey = "gxP0BiTJiKROxTe6FgPmiw==n7YQWZgMt1QSckQC"

    func fetchDogs(byName name: String) async {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/dogs?name=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else { return }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedDogs = try JSONDecoder().decode([Dog].self, from: data)
            DispatchQueue.main.async {
                self.dogs = decodedDogs
            }
        } catch {
            print("Error fetching dogs: \(error.localizedDescription)")
        }
    }
}
