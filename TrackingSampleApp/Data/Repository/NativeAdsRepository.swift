//
//  NativeAdsRepository.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol NativeAdsRepository {
    func findFirst(machineName: String) -> NativeAd?
    func findAll() -> [NativeAd]
}
