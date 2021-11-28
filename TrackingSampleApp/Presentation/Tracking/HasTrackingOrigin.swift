//
//  HasTrackingOrigin.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol HasTrackingOrigin {
    var trackingOrigin: TrackingOrigin { get }
}

enum TrackingOrigin: String {
    case articleList = "article_list"
    case feed
    case offersList = "offers_list"
}
