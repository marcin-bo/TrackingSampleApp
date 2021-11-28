//
//  TrackingService.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct TrackingService: EventsTracking {
    func track(event: Event) {
        print("TRACK EVENT: '\(event.name)' - origin: '\(event.origin)' - machineName: '\(event.machineName)'")
    }
}
