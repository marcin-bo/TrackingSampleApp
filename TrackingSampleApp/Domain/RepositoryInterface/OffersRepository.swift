//
//  OffersRepository.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol OffersRepository {
    func findFirst(machineName: String) -> Offer?
    func findAll() -> [Offer]
}
