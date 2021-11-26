//
//  Offer.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

struct Offer {
    let machineName: String
    let title: String
    let subtitle: String
    let imageFilename: String
    let description: String
    let price: Float
}

extension Offer: Widget { }
