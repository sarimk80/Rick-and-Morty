//
//  RickAndMortyViewModel.swift
//  Rick and Morty
//
//  Created by sarim khan on 20/01/2022.
//

import Foundation
import Combine


class RickAndMortyViewModel : ObservableObject {
    
    @Published var charactersState:CharacterViewModelState=CharacterViewModelState.initial
    
    let rickAndMoortyDataService:RickAndMortyDataServices=RickAndMortyDataServices()
    var cancellable = Set<AnyCancellable>()
    
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters(){
        charactersState=CharacterViewModelState.loading
        rickAndMoortyDataService.getAllCharacters()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.charactersState=CharacterViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Characters in
                self?.charactersState=CharacterViewModelState.loaded(characters: Characters)
            }
            .store(in: &cancellable)
    }
    
}
