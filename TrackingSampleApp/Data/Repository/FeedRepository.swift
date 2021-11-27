//
//  FeedRepository.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol FeedRepository {
    func findFirst(machineName: String) -> Widget?
    func findAll() -> [Widget]
}
