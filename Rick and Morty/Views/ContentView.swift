//
//  ContentView.swift
//  Rick and Morty
//
//  Created by sarim khan on 19/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.charactersState{
                    
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    ScrollView{
                        ForEach(data.results){ results in
                            
                            HStack {
                                AsyncImage(url: URL(string: results.image)){ image in
                                    image.resizable()
                                        .cornerRadius(25)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                VStack(alignment:.leading) {
                                    Text(results.name)
                                        .font(.headline)
                                        .fontWeight(.medium)
                                    Text(results.gender)
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                }
                                .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.leading)
                                Text(results.species)
                                    .font(.footnote)
                                    .fontWeight(.light)
                            }
                            .padding()
                            
                        }
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
