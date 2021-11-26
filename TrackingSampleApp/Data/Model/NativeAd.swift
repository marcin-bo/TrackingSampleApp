//
//  NativeAd.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

import Foundation

public struct NativeAd {
    public let machineName: String
    public let title: String
    public let subtitle: String
    public let imageFilename: String
    public let description: String
    public let url: URL
    public let widgets: [Widget]
}

extension NativeAd: Widget { }
