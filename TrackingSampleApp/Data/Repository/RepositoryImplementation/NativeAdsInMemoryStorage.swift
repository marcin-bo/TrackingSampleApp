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
            let title = TextGenerator.nativeAdTitle(id: i)
            let machineName = title.machineName
            let subtitle = TextGenerator.subtitle(id: i)
            let text = TextGenerator.text(id: i)
            let widgets = [Widget]()
            
            let entity = NativeAd(
                machineName: machineName,
                title: title,
                subtitle: subtitle,
                description: text,
                imageFilename: "native-ad.png",
                url: URL(string: "https://google.com")!,
                widgets: widgets
            )
            result.append(entity)
        }
        
        return result
    }
}
