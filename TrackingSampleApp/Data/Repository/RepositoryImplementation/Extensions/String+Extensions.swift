//
//  String+Extensions.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

extension String {
    var machineName: String {
        self.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}
