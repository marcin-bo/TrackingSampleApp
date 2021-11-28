//
//  OfferEvents.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct OfferClickEvent: Event {
    let name = "offer_click"
    let origin: String
    let machineName: String
}

struct OfferImpressionEvent: Event {
    let name = "offer_impression"
    let origin: String
    let machineName: String
}

struct OfferConversionEvent: Event {
    let name = "offer_conversion"
    let origin: String
    let machineName: String
}
