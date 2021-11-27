//
//  ArticlesRepository.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol ArticlesRepository {
    func findFirst(machineName: String) -> Article?
    func findAll() -> [Article]
}
