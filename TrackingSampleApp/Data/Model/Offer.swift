//
//  Offer.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

public struct Offer {
    public let machineName: String
    public let title: String
    public let subtitle: String
    public let imageFilename: String
    public let description: String
    public let price: Float
}

extension Offer: Widget { }
