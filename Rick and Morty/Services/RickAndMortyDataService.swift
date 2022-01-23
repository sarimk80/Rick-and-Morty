//
//  RickAndMortyDataService.swift
//  Rick and Morty
//
//  Created by sarim khan on 20/01/2022.
//

import Foundation
import Combine


class RickAndMortyDataServices: RickAndMortyService{
    func getAllCharacters() -> AnyPublisher<Characters, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({$0.data})
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
