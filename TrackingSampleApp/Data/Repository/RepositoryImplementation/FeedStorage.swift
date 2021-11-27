//
//  FeedStorage.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct FeedStorage: FeedRepository {
    private let articleRepository: ArticlesRepository
    private let nativeAdsRepository: NativeAdsRepository
    private let offersRepository: OffersRepository
    
    init(articleRepository: ArticlesRepository,
         nativeAdsRepository: NativeAdsRepository,
         offersRepository: OffersRepository) {
        self.articleRepository = articleRepository
        self.nativeAdsRepository = nativeAdsRepository
        self.offersRepository = offersRepository
    }
    
    func findFirst(machineName: String) -> Widget? {
        findAll().first(where: { $0.machineName == machineName} )
    }
    
    func findAll() -> [Widget] {
        var widgets = [Widget]()
        
        // Generate feed elements
        for i in 1...30 {
            if i % 3 == 0 {
                if let found = articleRepository.findFirst(machineName: "article-\(i)") {
                    widgets.append(found)
                }
            } else if i % 3 == 1 {
                if let found = offersRepository.findFirst(machineName: "offer-\(i)") {
                    widgets.append(found)
                }
            } else {
                if let found = nativeAdsRepository.findFirst(machineName: "native-ad-\(i)") {
                    widgets.append(found)
                }
            }
        }
        return widgets
    }
}
