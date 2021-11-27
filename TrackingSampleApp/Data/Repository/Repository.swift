//
//  ArticlesRepository.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol Repository {
    associatedtype Model
    
    func findFirst(machineName: String) -> Model?
    func findAll() -> [Model]
}
