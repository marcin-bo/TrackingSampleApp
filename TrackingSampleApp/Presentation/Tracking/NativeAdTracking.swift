//
//  NativeAdTracking.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol NativeAdTracking: HasTrackingOrigin {
    var eventsTracking: EventsTracking { get }
    
    func trackNativeAdClick(_ nativeAd: NativeAd)
    func trackNativeAdImpression(_ nativeAd: NativeAd)
}

extension NativeAdTracking {
    func trackNativeAdClick(_ nativeAd: NativeAd) {
        eventsTracking.track(
            event: NativeAdClickEvent(
                origin: trackingOrigin.rawValue,
                machineName: nativeAd.machineName
            )
        )
    }
    
    func trackNativeAdImpression(_ nativeAd: NativeAd) {
        eventsTracking.track(
            event: NativeAdImpressionEvent(
                origin: trackingOrigin.rawValue,
                machineName: nativeAd.machineName
            )
        )
    }
}
