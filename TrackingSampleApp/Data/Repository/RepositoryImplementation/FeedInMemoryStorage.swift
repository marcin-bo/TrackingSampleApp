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
        
        for i in 1...30 {
            if i % 3 == 0 {
                if let found = articleStorage.findFirst(machineName: "article-\(i)") {
                    widgets.append(found)
                }
            } else if i % 3 == 1 {
                if let found = offersStorage.findFirst(machineName: "offer-\(i)") {
                    widgets.append(found)
                }
            } else {
                if let found = nativeAdsStorage.findFirst(machineName: "native-ad-\(i)") {
                    widgets.append(found)
                }
            }
        }
        return widgets
    }
}
