//
//  NativeAdViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol NativeAdViewModelInterface {
    // Output
    var title: String? { get }
    var description: String? { get }
    
    func count() -> Int
    func getWidgetAt(index: Int) -> Widget?
    
    // Actions
    var actions: NativeAdViewModelActions? { get set }
}

struct NativeAdViewModelActions {
    let didSelectWidget: ((Widget) -> Void)?
}

struct NativeAdViewModel {
    var actions: NativeAdViewModelActions?
    private let nativeAdsRepository: NativeAdsRepository
    private let nativeAd: NativeAd?
    
    init(nativeAdsRepository: NativeAdsRepository, machineName: String) {
        self.nativeAdsRepository = nativeAdsRepository
        self.nativeAd = nativeAdsRepository.findFirst(machineName: machineName)
    }
}

extension NativeAdViewModel: NativeAdViewModelInterface {
    var title: String? {
        nativeAd?.title
    }
    
    var description: String? {
        nativeAd?.description
    }
    
    func count() -> Int {
        nativeAd?.widgets.count ?? 0
    }
    
    func getWidgetAt(index: Int) -> Widget? {
        guard let nativeAd = nativeAd,
              index < nativeAd.widgets.count
        else {
            return nil
        }
        return nativeAd.widgets[index]
    }
}
