//
//  OfferTracking.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol OfferTracking: HasTrackingOrigin {
    var eventsTracking: EventsTracking { get }
    
    func trackOfferClick(_ offer: Offer)
    func trackOfferImpression(_ offer: Offer)
    func trackOfferConversion(_ offer: Offer)
}

extension OfferTracking {
    func trackOfferClick(_ offer: Offer) {
        eventsTracking.track(
            event: OfferClickEvent(
                origin: trackingOrigin.rawValue,
                machineName: offer.machineName
            )
        )
    }
    
    func trackOfferImpression(_ offer: Offer) {
        eventsTracking.track(
            event: OfferImpressionEvent(
                origin: trackingOrigin.rawValue,
                machineName: offer.machineName
            )
        )
    }
    
    func trackOfferConversion(_ offer: Offer) {
        eventsTracking.track(
            event: OfferConversionEvent(
                origin: trackingOrigin.rawValue,
                machineName: offer.machineName
            )
        )
    }
}
