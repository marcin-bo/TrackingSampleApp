//
//  NativeAd.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

import Foundation

struct NativeAd {
    let machineName: String
    let title: String
    let subtitle: String
    let description: String
    let imageFilename: String
    let url: URL
    let widgets: [Widget]
}

extension NativeAd: Widget { }
