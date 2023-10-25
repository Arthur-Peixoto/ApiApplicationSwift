//
//  CharacterDetail.swift
//  swiftAPI
//
//  Created by Student04 on 19/10/23.
//

import Foundation


class viewModel : ObservableObject{
    
    @Published var chars : [Character] = []
   
    func fetchCharacters() {
        if let url = URL(string: "https://swapi.dev/api/people/?format=json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedData = try? JSONDecoder().decode(API.self, from: data) {
                        self.chars = decodedData.results
                    }
                }
            }.resume()
        }
    }
    
}




struct API : Decodable{
    var results : [Character]
}

struct Character: Hashable, Decodable {
    let name: String?
    let gender: String?
    let mass: String?
}
