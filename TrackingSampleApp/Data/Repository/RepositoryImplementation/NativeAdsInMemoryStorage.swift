//
//  NativeAdsInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import Foundation

struct NativeAdsInMemoryStorage: Repository {
    func findFirst(machineName: String) -> NativeAd? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [NativeAd] {
        var result = [NativeAd]()
        
        for i in 1...30 {
            result.append(ContentGenerator.makeNativeAd(id: i))
        }
        
        return result
    }
}
