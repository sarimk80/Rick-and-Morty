//
//  Characters.swift
//  Rick and Morty
//
//  Created by sarim khan on 20/01/2022.
//

import Foundation



enum CharacterViewModelState {
case initial
case loading
case loaded(characters:Characters)
case error(errorMessage:String)
    
}

struct Characters : Codable{
    let info: Info
    let results: [Results]
}

struct Info : Codable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "https://rickandmortyapi.com/api/character?page=2",
    let prev:String?//": null
}

struct Results: Identifiable,Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location:Codable {
    let name:String//": "Citadel of Ricks",
    let url:String//": "https://rickandmortyapi.com/api/location/3"
}


