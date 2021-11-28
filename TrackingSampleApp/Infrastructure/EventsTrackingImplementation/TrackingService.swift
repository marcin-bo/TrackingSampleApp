//
//  TrackingService.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

struct TrackingService: EventsTracking {
    func track(event: Event) {
        print("EVENT: \(event.name) | ORIGIN: \(event.origin) | MACHINENAME: \(event.machineName)")
    }
}
