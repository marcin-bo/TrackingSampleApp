//
//  Event.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

protocol Event {
    var name: String { get }
    
    // Parameters
    var origin: String { get }
    var machineName: String { get }
}
