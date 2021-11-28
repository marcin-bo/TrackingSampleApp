//
//  NativeAdViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct NativeAdViewModel {
    private let nativeAdsRepository: NativeAdsRepository
    private let nativeAd: NativeAd?
    
    init(nativeAdsRepository: NativeAdsRepository, machineName: String) {
        self.nativeAdsRepository = nativeAdsRepository
        self.nativeAd = nativeAdsRepository.findFirst(machineName: machineName)
    }
    
    var title: String? {
        nativeAd?.title
    }
    
    var description: String? {
        nativeAd?.description
    }
    
    func count() -> Int {
        nativeAd?.widgets.count ?? 0
    }
    
    func getItemAt(index: Int) -> Widget? {
        guard let nativeAd = nativeAd,
              index < nativeAd.widgets.count
        else {
            return nil
        }
        return nativeAd.widgets[index]
    }
}
