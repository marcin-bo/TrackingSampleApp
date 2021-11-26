//
//  Article.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

public struct Article {
    public let machineName: String
    public let title: String
    public let subtitle: String
    public let imageFilename: String
    public let widgets: [Widget]
}

extension Article: Widget { }
