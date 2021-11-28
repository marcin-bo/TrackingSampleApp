//
//  NativeAdEvents.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct NativeAdClickEvent: Event {
    let name = "native_ad_click"
    let origin: String
    let machineName: String
}

struct NativeAdImpressionEvent: Event {
    let name = "native_ad_impression"
    let origin: String
    let machineName: String
}
