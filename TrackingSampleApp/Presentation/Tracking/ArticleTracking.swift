//
//  ArticleTracking.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol ArticleTracking: HasTrackingOrigin {
    var eventsTracking: EventsTracking { get }
    
    func trackArticleClick(_ article: Article)
    func trackArticleImpression(_ article: Article)
}

extension ArticleTracking {
    func trackArticleClick(_ article: Article) {
        eventsTracking.track(
            event: ArticleClickEvent(
                origin: trackingOrigin.rawValue,
                machineName: article.machineName
            )
        )
    }
    
    func trackArticleImpression(_ article: Article) {
        eventsTracking.track(
            event: ArticleImpressionEvent(
                origin: trackingOrigin.rawValue,
                machineName: article.machineName
            )
        )
    }
}
