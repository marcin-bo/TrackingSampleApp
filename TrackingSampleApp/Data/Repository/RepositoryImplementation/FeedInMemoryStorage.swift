//
//  FeedInMemoryStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct FeedInMemoryStorage: Repository {
    private let articleStorage: ArticlesInMemoryStorage
    private let nativeAdsStorage: NativeAdsInMemoryStorage
    private let offersStorage: OffersInMemoryStorage
    
    init(articleStorage: ArticlesInMemoryStorage,
         nativeAdsStorage: NativeAdsInMemoryStorage,
         offersStorage: OffersInMemoryStorage) {
        self.articleStorage = articleStorage
        self.nativeAdsStorage = nativeAdsStorage
        self.offersStorage = offersStorage
    }
    
    func findFirst(machineName: String) -> Widget? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Widget] {
        var widgets = [Widget]()
        if let found = articleStorage.findFirst(machineName: "article-1") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-1") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-3") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-4") {
            widgets.append(found)
        }
        if let found = articleStorage.findFirst(machineName: "article-3") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-1") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-4") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-6") {
            widgets.append(found)
        }
        if let found = articleStorage.findFirst(machineName: "article-5") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-3") {
            widgets.append(found)
        }
        if let found = articleStorage.findFirst(machineName: "article-4") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-2") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-6") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-5") {
            widgets.append(found)
        }
        if let found = articleStorage.findFirst(machineName: "article-6") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-2") {
            widgets.append(found)
        }
        if let found = articleStorage.findFirst(machineName: "article-2") {
            widgets.append(found)
        }
        if let found = offersStorage.findFirst(machineName: "offer-5") {
            widgets.append(found)
        }
        if let found = nativeAdsStorage.findFirst(machineName: "native-ad-6") {
            widgets.append(found)
        }
        return widgets
    }
}
