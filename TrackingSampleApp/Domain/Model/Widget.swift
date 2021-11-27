//
//  Widget.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 26/11/2021.
//

public protocol Widget {
    var machineName: String { get }
    var title: String { get }
    var subtitle: String { get }
    var imageFilename: String { get }
}
