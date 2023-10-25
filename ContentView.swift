//
//  ContentView.swift
//  swiftAPI
//
//  Created by Student04 on 19/10/23.
//
import SwiftUI

struct ContentView: View {
   
    @StateObject var vm = viewModel()

    var body: some View {
        NavigationView {
            VStack{
                Text("\(vm.chars.count)")
                List(vm.chars, id: \.self) { character in
                    NavigationLink(destination: CharacterDetail(character: character)) {
                        Text(character.name!)
                    }
                }
                .onAppear(){
                    vm.fetchCharacters()
                }
                .navigationTitle("Star Wars Characters")
            }
        }
    }

   
}

struct CharacterDetail: View {
    var character: Character
    
    var body: some View {
        VStack {
            Text("Name: \(character.name!)")
            Text("Gender: \(character.gender!)")
            Text("Mass: \(character.mass!)")
        }
        .padding()
        .navigationTitle(character.name!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

