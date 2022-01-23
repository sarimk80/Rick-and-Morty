//
//  RickandMortyProtocol.swift
//  Rick and Morty
//
//  Created by sarim khan on 20/01/2022.
//

import Foundation
import Combine

protocol RickAndMortyService {
    func getAllCharacters () -> AnyPublisher<Characters,Error>
}
