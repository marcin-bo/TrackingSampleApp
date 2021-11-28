//
//  ArticleEvents.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct ArticleClickEvent: Event {
    let name = "article_click"
    let origin: String
    let machineName: String
}

struct ArticleImpressionEvent: Event {
    let name = "article_impression"
    let origin: String
    let machineName: String
}
