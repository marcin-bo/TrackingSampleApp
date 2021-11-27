//
//  Article.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

struct Article {
    let machineName: String
    let title: String
    let subtitle: String
    let content: String
    let imageFilename: String
    let widgets: [Widget]
}

extension Article: Widget { }
